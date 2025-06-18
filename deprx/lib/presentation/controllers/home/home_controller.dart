import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/service/procedure_service.dart';

class HomeController extends GetxController {
  final AttendanceUseCase attendanceUseCase;
  final RewardUseCase rewardUseCase;
  final BDIUseCase bdiUseCase;
  final BAUseCase baUseCase;

  HomeController(this.attendanceUseCase, this.rewardUseCase, this.bdiUseCase,
      this.baUseCase);

  final ProcedureService service = Get.find();

  int get week => service.week;

  int get round => service.round;

  bool get isFinal => service.isFinal;

  ///
  /// Attendance
  ///
  RxString attendanceWeek = ''.obs;
  RxList<AttendanceDayModel> attendanceList = <AttendanceDayModel>[].obs;
  RxMap<int, List<BAModel>> baList = <int, List<BAModel>>{}.obs;
  RxBool attendanceLoading = true.obs;

  void initAttendance() async {
    if (attendanceList.isEmpty) {
      await attendanceUseCase.attended(successFunction: (value) {
        attendanceWeek.value = value.attendanceWeek;
        DateTime now = DateTime.now();
        for (AttendanceItemModel item in value.attendance) {
          attendanceList.add(AttendanceDayModel(
              day: item.day,
              type: item.day == now.day
                  ? AttendDayType.today
                  : item.attended
                      ? AttendDayType.attend
                      : AttendDayType.none));
          baList[item.day] = item.baList;
        }
        attendanceList.refresh();
        baList.refresh();
        attendanceLoading.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  Future<void> resetAttendance() async {
    attendanceLoading.value = true;
    await attendanceUseCase.attended(successFunction: (response) {
      attendanceList.clear();
      baList.clear();
      attendanceWeek.value = response.attendanceWeek;
      DateTime now = DateTime.now();
      for (AttendanceItemModel item in response.attendance) {
        attendanceList.add(AttendanceDayModel(
            day: item.day,
            type: item.day == now.day
                ? AttendDayType.today
                : item.attended
                    ? AttendDayType.attend
                    : AttendDayType.none));
        baList[item.day] = item.baList;
      }
      attendanceList.refresh();
      baList.refresh();
      attendanceLoading.value = false;
    }, failFunction: (error) {
      attendanceLoading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.homePage);
    });
  }

  ///
  /// Step
  ///
  RxList<StepItemModel> stepList = <StepItemModel>[].obs;
  RxBool stepLoading = true.obs;

  void initStep() async {
    await rewardUseCase.getMainRewardList(successFunction: (response) {
      stepList.value = response;
      stepLoading.value = false;
    }, failFunction: (error) {
      stepLoading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.homePage);
    });
  }

  RxString name = ''.obs;
  RxString finalReward = ''.obs;

  Rx<FinalRewardModel> finalRewardValue = const FinalRewardModel().obs;
  RxBool finalRewardLoading = false.obs;

  void getFinalReward() async {
    if (finalRewardValue.value == const FinalRewardModel()) {
      finalRewardLoading.value = true;
      await rewardUseCase.getFinalReward(successFunction: (response) {
        finalRewardValue.value = response;
        finalReward.value = response.contents;
        finalRewardLoading.value = false;
      }, failFunction: (error) {
        finalRewardLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  final BDIResultModel _standardBDIResult = const BDIResultModel(bdiResult: -1);

  late Rx<BDIResultModel> bdiResult = _standardBDIResult.obs;

  bool bdiEmpty() => bdiResult.value == _standardBDIResult;

  RxBool bdiLoading = false.obs;
  final PrefUtil spUtil = PrefUtil();

  void getBDIResult() async {
    if (bdiLoading.value == false) {
      bdiLoading.value = true;
      await bdiUseCase.bdiResult(successFunction: (response) {
        bdiResult.value = response;
        name.value = spUtil.userName;
        bdiLoading.value = false;
      }, failFunction: (error) {
        bdiLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  DateTime now = DateTime.now();
  late Rx<DateTime> startDate = now.obs;
  late Rx<DateTime> endDate = now.obs;
  RxBool programLoading = false.obs;

  void getProgramInfo() async {
    if (startDate.value == now || endDate.value == now) {
      programLoading.value = true;
      await baUseCase.getProgramInfo(successFunction: (response) {
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

  String calSelectedDate(int idx) {
    try {
      DateTime added = startDate.value.add(Duration(days: (week * 7) + idx));
      return DateFormat('yyyy-MM-dd').format(added);
    } catch (e) {
      return '';
    }
  }

  List<Map<String, dynamic>> convertStepList() {
    return stepList.value
        .map((e) => {'reward_name': e.value, 'week': e.week, 'date': e.date})
        .toList();
  }

  //앱 껐다 켰을 때
  void processFcmData() {
    String? fcmData = ObjectBoxUtil().readFcmData();
    if (fcmData != null && fcmData != '') {
      service.processFcm(fcmData);
    }
  }
}
