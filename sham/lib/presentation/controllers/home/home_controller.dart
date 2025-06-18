import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class HomeController extends GetxController {
  final AttendanceUseCase attendanceUseCase;
  final RewardUseCase rewardUseCase;
  final BDIUseCase bdiUseCase;

  HomeController(this.attendanceUseCase, this.rewardUseCase, this.bdiUseCase);

  final ProcedureService service = Get.find();

  int get week => service.week;

  int get round => service.round;

  bool get isFinal => service.isFinal;

  final DateTime now = DateTime.now();

  ///
  /// Attendance
  ///
  RxString attendanceWeek = ''.obs;
  RxList<AttendanceDayModel> attendanceList = <AttendanceDayModel>[].obs;
  RxMap<int, List<TodayTaskItemModel>> todayTaskList =
      <int, List<TodayTaskItemModel>>{}.obs;
  RxBool attendanceLoading = true.obs;

  void initAttendance() async {
    if (attendanceList.isEmpty) {
      await attendanceUseCase.shamAttended(successFunction: (value) {
        attendanceWeek.value = value.attendanceWeek;
        DateTime now = DateTime.now();
        for (ShamAttendanceItemModel item in value.attendance) {
          attendanceList.add(AttendanceDayModel(
              day: item.day,
              type: item.day == now.day
                  ? AttendDayType.today
                  : item.attended
                      ? AttendDayType.attend
                      : AttendDayType.none));
          todayTaskList[item.day] = item.todayTaskList;
        }
        attendanceList.refresh();
        todayTaskList.refresh();
        attendanceLoading.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  Future<void> resetAttendance() async {
    if(!attendanceLoading.value){
      attendanceLoading.value = true;
      await attendanceUseCase.shamAttended(successFunction: (response) {
        attendanceList.clear();
        todayTaskList.clear();
        attendanceWeek.value = response.attendanceWeek;
        DateTime now = DateTime.now();
        for (ShamAttendanceItemModel item in response.attendance) {
          attendanceList.add(AttendanceDayModel(
              day: item.day,
              type: item.day == now.day
                  ? AttendDayType.today
                  : item.attended
                  ? AttendDayType.attend
                  : AttendDayType.none));
          todayTaskList[item.day] = item.todayTaskList;
        }
        attendanceList.refresh();
        todayTaskList.refresh();
        attendanceLoading.value = false;
      }, failFunction: (error) {
        attendanceLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  ///
  /// Step
  ///
  RxList<StepItemModel> stepList = <StepItemModel>[].obs;
  RxBool stepLoading = true.obs;

  void initStep() async {
    if (stepList.isEmpty || service.isFinal) {
      await rewardUseCase.getMainRewardList(successFunction: (response) {
        stepList.value = response;
        stepLoading.value = false;
      }, failFunction: (error) {
        stepLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.homePage);
      });
    }
  }

  RxString name = '클레어'.obs;
  RxString finalReward = '햄버거 세트'.obs;

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
}
