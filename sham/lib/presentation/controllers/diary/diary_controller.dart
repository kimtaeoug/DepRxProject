import 'package:api/api.dart';
import 'package:api/data/model/diary/rm_model.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';
import 'package:sham/core/service/procedure_service.dart';
import 'package:sham/presentation/controllers/home/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryController extends GetxController {
  final DiaryUseCase diaryUseCase;

  DiaryController(this.diaryUseCase);

  RxBool contentLoading = false.obs;
  RxString contents = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initRecogMe();
  }

  void saveTd() async {
    if(!contentLoading.value){
      contentLoading.value = true;
      await diaryUseCase.saveTd(contents.value, () async {
        contentLoading.value = false;
        await Get.find<HomeController>().resetAttendance();
        resetMonthTask(now);
        contents.value = '';
        if (week == 8 && isSameDay(endDate.value, now)) {
          _service.getProcedure(successFunction: (value) async {
            if (_service.isFinal) {
              _service.move();
            } else {
              Get.close(3);
            }
          });
        } else {
          Get.close(3);
        }
      }, (error) {
        contentLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  RxString emotion = ''.obs;
  RxBool emotionLoading = false.obs;

  void saveTed() async {
    if (emotionLoading.value == false) {
      emotionLoading.value = true;
      diaryUseCase.saveTed(emotion.value, () {
        emotionLoading.value = false;
        _service.getProcedure(
            successFunction: (response) {
              _service.move();
            },
            failFunction: () {
              ToastHandler().showExceptionError();
            },
            recursionFlag: false);
      }, (error) {
        emotionLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  final ProcedureService _service = Get.find();
  final JsonService _jsonService = JsonService();

  int get week => _service.week;

  int get round => _service.round;

  final int _totalWeek = 9;
  final RecognizeMeDataEntity _default = RecognizeMeDataEntity();
  late Rx<RecognizeMeDataEntity> recogData = _default.obs;
  final RxMap<int, RecognizeMeDataEntity> recogTitleMap =
      <int, RecognizeMeDataEntity>{}.obs;
  RxBool loading = false.obs;

  void initRecogMe() async {
    try{
      if (week > 3) {
        if (recogData.value == _default && loading.value == false) {
          loading.value = true;
          for (int w = 4; w < _totalWeek; w++) {
            RecognizeMeDataEntity weekData =
            await Resource.recognizeMe(_jsonService, w);
            if (w == week) {
              recogData.value = weekData;
            }
            recogTitleMap[w] = weekData;
          }
          recogData.refresh();
          loading.value = false;
        }
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  RxMap<int, String> savedRecogData = <int, String>{}.obs;
  RxBool saveLoading = false.obs;

  void saveRm() async {
    if (saveLoading.value == false) {
      saveLoading.value = true;
      await diaryUseCase.saveRm(week, round, savedRecogData.values.toList(),
          () {
        saveLoading.value = false;
        _service.move();
      }, (error) {
        saveLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  RxMap<String, DiaryModel> tedDataMap = <String, DiaryModel>{}.obs;
  RxBool tedLoading = false.obs;

  void getTedData(DateTime time) async {
    String timeData = TimeUtil.convertDateTo(time, 'yyyy-MM-dd');
    if (!tedDataMap.containsKey(timeData)) {
      tedLoading.value = true;
      diaryUseCase.getTed(timeData, (data) {
        tedDataMap[timeData] = data;
        tedDataMap.refresh();
        tedLoading.value = false;
      }, (e) {
        tedLoading.value = false;
        ErrorHandler.manageError(e.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
      });
    }
  }

  RxMap<String, DiaryModel> tdDataMap = <String, DiaryModel>{}.obs;
  RxBool tdLoading = false.obs;

  void getTdData(DateTime time) async {
    String timeData = TimeUtil.convertDateTo(time, 'yyyy-MM-dd');
    if (!tdDataMap.containsKey(timeData)) {
      tdLoading.value = true;
      diaryUseCase.getTd(timeData, (data) {
        tdDataMap[timeData] = data;
        tdDataMap.refresh();
        tdLoading.value = false;
      }, (e) {
        tdLoading.value = false;
        ErrorHandler.manageError(e.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
      });
    }
  }

  RxMap<int, RmModel> rmDataMap = <int, RmModel>{}.obs;
  RxBool rmLoading = false.obs;

  void getRmData(int selectedWeek) async {
    if (!rmDataMap.containsKey(selectedWeek)) {
      rmLoading.value = true;
      diaryUseCase.getRm(selectedWeek, round, (data) {
        rmDataMap[selectedWeek] = data;
        rmDataMap.refresh();
        rmLoading.value = false;
      }, (e) {
        rmLoading.value = false;
        ErrorHandler.manageError(e.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
      });
    }
  }

  ///
  /// Month
  ///
  Rx<DateTime> selectedData = DateTime.now().obs;
  RxBool monthLoading = true.obs;
  RxMap<String, List<TaskModel>> monthMap = <String, List<TaskModel>>{}.obs;
  final TaskModel defaultTask = TaskModel();

  bool checkDateExisting(DateTime time) {
    String yearMonth = TimeUtil.convertDateTo(time, 'yyyy-MM');
    if (monthMap.keys.contains(yearMonth)) {
      if ((monthMap[yearMonth]?.where((e) => e.day == time.day).isNotEmpty) ==
          true) {
        return true;
      }
    }
    return false;
  }

  TaskModel getSelectedDay(DateTime time) {
    String yearMonth = TimeUtil.convertDateTo(time, 'yyyy-MM');
    if (monthMap.keys.contains(yearMonth)) {
      return monthMap[yearMonth]?.where((e) => e.day == time.day).first ??
          defaultTask;
    } else {
      return defaultTask;
    }
  }

  void initMonthTask(DateTime selectedTime, {bool showToast = false}) async {
    String yearMonth = TimeUtil.convertDateTo(selectedTime, 'yyyy-MM');
    if (monthMap[yearMonth] == null || (monthMap[yearMonth]?.isEmpty == true)) {
      monthLoading.value = true;
      await diaryUseCase.getMonthData(yearMonth, (result) {
        monthMap[yearMonth] = result;
        monthMap.refresh();
        monthLoading.value = false;
      }, (error) async {
        monthLoading.value = false;
        if (showToast) {
          ToastHandler().showExceptionError();
        } else {
          ErrorHandler.manageError(error.errorCode, Get.currentRoute,
              moveRoute: Routes.activityPage);
        }
      });
    }
  }

  void resetMonthTask(DateTime selectedTime, {bool showToast = false}) async {
    String yearMonth = TimeUtil.convertDateTo(selectedTime, 'yyyy-MM');
    monthLoading.value = true;
    await diaryUseCase.getMonthData(yearMonth, (result) {
      monthMap[yearMonth] = result;
      monthMap.refresh();
      monthLoading.value = false;
    }, (error) async {
      monthLoading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.activityPage);
    });
  }

  void calendarLeftFunction() {
    try{
      DateTime beforeTime = TimeUtil.calBeforeMonth(selectedData.value);
      if (beforeTime.isBefore(startDate.value)) {
        selectedData.value = startDate.value;
      } else {
        selectedData.value = beforeTime;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void calendarRightFunction() {
    try{
      DateTime afterTime = TimeUtil.calAfterMonth(selectedData.value);
      if (afterTime.isAfter(endDate.value)) {
        selectedData.value = endDate.value;
      } else {
        selectedData.value = afterTime;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  final DateTime now = DateTime.now();

  late Rx<DateTime> startDate = now.obs;
  late Rx<DateTime> endDate = now.obs;
  RxBool programLoading = false.obs;

  void getProgramInfo() async {
    if (startDate.value == now || endDate.value == now) {
      programLoading.value = true;
      await diaryUseCase.getProgramInfo(successFunction: (response) {
        DateTime? start = DateTime.tryParse(response.startDate);
        DateTime? end = DateTime.tryParse(response.endDate);
        if (start != null && end != null) {
          startDate.value = start;
          endDate.value = end;
          programLoading.value = false;
        } else {
          throw Exception(response);
        }
      }, failFunction: (error) {
        programLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
      });
    }
  }
}
