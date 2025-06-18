import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';

import '../../../core/service/procedure_service.dart';

class LibraryController extends GetxController {
  final EducationUseCase useCase;
  final RewardUseCase rewardUseCase;

  LibraryController(this.useCase, this.rewardUseCase);

  final ProcedureService service = Get.find();

  int get week => service.week;

  final JsonService _jsonService = JsonService();

  bool initLoading = false;

  Future<void> initData() async {
    try{
      initLoading = true;
      update();
      await initCurriculum();
      await initEducation();
      getLastEduList();
      initLoading = false;
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }

  Map<int, CurriculumItemModel> curriMap = {};

  Future<void> initCurriculum() async {
    try{
      if (curriMap.isEmpty) {
        CurriculumModel data = await Resource.curriculumData(_jsonService);
        for (int idx = 0; idx < data.list.length; idx++) {
          CurriculumItemModel item = data.list[idx];
          curriMap[idx + 1] = item;
        }
        update();
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  Map<int, EducationItemModel> eduMap = {};
  Map<int, String> eduTitle = {};

  Future<void> initEducation() async {
    try{
      if (eduMap.isEmpty) {
        eduMap.clear();
        EducationModel rawData = await Resource.eduData(_jsonService);
        for (int idx = 0; idx < rawData.educationList.length; idx++) {
          EducationItemModel item = rawData.educationList[idx];
          eduMap[idx + 1] = item;
          eduTitle[idx + 1] = item.title;
        }
        update();
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  RxBool completeEducationLoading = false.obs;

  void setLastEduList(int input) {
    try{
      int idx = lastEduList.indexOf(input);
      lastEduList = List.from(lastEduList)
        ..removeAt(idx)
        ..insert(idx, -1);
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void completeEducation(int week) async {
    lastEduLoading = true;
    update();
    await useCase.completeEducation(week, successFunction: () {
      lastEduLoading = false;
      setLastEduList(week);
      if (lastEduList.where((e) => e != -1).isNotEmpty) {
        Get.offNamed(Routes.continuousEducationPage, arguments: {'week': week});
      } else {
        checkStamp(service.round);
      }
    }, failFunction: (error) {
      lastEduLoading = false;
      update();
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        service.move();
      });
    });
  }

  //rewardUseCase
  void checkStamp(int round) async {
    await rewardUseCase.getStampReward(round, successFunction: (data) {
      if (data.isNotEmpty) {
        Get.offNamed(Routes.rewardReceiveStampPage, arguments: {
          'data': data,
          'function': () {
            service.move();
          }
        });
      } else {
        service.move();
      }
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        service.move();
      });
    });
  }

  bool isCheck = false;

  void setIsCheck(bool input) {
    try{
      isCheck = input;
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void complete(int week, bool isNotFromTab) {
    try{
      if (isCheck) {
        if (!completeEducationLoading.value) {
          if (isNotFromTab) {
            completeEducation(week);
            isCheck = false;
            update();
          }
        }
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  bool checkIsAllMinus() {
    return lastEduList.where((e) => e != -1).isEmpty;
  }

  List<int> lastEduList = [];
  bool lastEduLoading = false;

  void getLastEduList() async {
    if (lastEduList.isEmpty) {
      lastEduLoading = true;
      update();
      await useCase.getLastEducation(successFunction: (value) {
        lastEduLoading = false;
        lastEduList = value.remainEducationList;
        update();
      }, failFunction: (error) {
        lastEduLoading = false;
        lastEduList.clear();
        lastEduList = [];
        update();
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.libraryPage);
      });
    }
  }

  void clearLastEduList() {
    try{
      lastEduList.clear();
      lastEduList = [];
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }
}
