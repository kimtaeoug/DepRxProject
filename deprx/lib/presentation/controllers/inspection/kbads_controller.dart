import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';

import '../../../core/service/procedure_service.dart';

class KBADSController extends GetxController {
  final KBADSUseCase useCase;

  KBADSController(this.useCase);

  final ProcedureService service = Get.find();

  bool get isFinal => service.isFinal;

  int get week => service.week;

  int get round => service.round;

  final JsonService _jsonService = JsonService();

  RxList<String> kbadsList = <String>[].obs;
  RxList<int> kbadsValueList = <int>[].obs;

  void initKBADSList() async {
    try{
      KBADSListModel data = await Resource.kbadsListData(_jsonService);
      try {
        kbadsList.value = [];
        kbadsValueList.value = [];
        kbadsList.value = data.list;
        kbadsList.refresh();
        kbadsValueList.value = List.generate(kbadsList.length, (idx) => -1);
      } catch (e) {
        kbadsList.value = data.list;
        kbadsList.refresh();
        kbadsValueList.value = List.generate(kbadsList.length, (idx) => -1);
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void clickFunction(int pageIdx, int value) {
    kbadsValueList[pageIdx] = value;
    kbadsValueList.refresh();
  }

  bool checkValue(int value, int pageIdx) =>
      value != -1 ? kbadsValueList[pageIdx] == value : false;

  void clearValueList() {
    try{
      kbadsValueList.clear();
      kbadsValueList.value = List.generate(kbadsList.length, (idx) => -1);
    }catch(e){
      ToastHandler().logicError();
    }
  }

  RxBool loading = false.obs;

  void completeKBADS({bool? rsi}) async {
    if (!loading.value) {
      loading.value = true;
      await useCase.completeKBADS(
          kbadsValueList,
          service.week - (service.isFinal ? 0 : 1),
          service.round, successFunction: () {
        loading.value = false;
        service.move();
      }, failFunction: (error) {
        loading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }
}
