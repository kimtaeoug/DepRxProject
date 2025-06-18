import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';

import '../../../core/service/procedure_service.dart';

class ReportController extends GetxController {
  final ReportUseCase useCase;
  final BAUseCase baUseCase;

  ReportController(this.useCase, this.baUseCase);

  final ProcedureService service = Get.find();
  final JsonService jsonService = JsonService();

  int get week => service.week;

  int get apiWeek => service.apiWeek;

  RxList<WeekReportItemModel> totalReportList = <WeekReportItemModel>[].obs;
  RxBool totalReportLoading = true.obs;

  void initReportTotalList() async {
    if (totalReportList.isEmpty || service.isFinal) {
      totalReportLoading.value = true;
      if (service.isFinal) {
        totalReportList.clear();
      }
      await useCase.roundReport(service.round, successFunction: (response) {
        totalReportList.value = response;
        totalReportList.refresh();
        totalReportLoading.value = false;
      }, failFunction: (error) {
        totalReportLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  //ba select
  void getRecommendedBA(Function() toastFunction) async {
    await baUseCase.getRecommendedBAList(successFunction: (response) {
      service.move();
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  //detail report
  ///
  /// Get Week Report
  ///
  RxMap<int, ReportModel> reportData = <int, ReportModel>{}.obs;
  RxBool loading = false.obs;

  bool isReportEmpty(ReportModel input) {
    return input.week == 0 && input.achieveRate == 0 && input.baList.isEmpty;
  }

  void getWeekReport(int inputWeek, {Function()? function}) async {
    if (reportData[inputWeek] == null) {
      if (!loading.value) {
        loading.value = true;
        await useCase.weekReport(service.round, inputWeek,
            successFunction: (value) {
          reportData[inputWeek] = value;
          reportData.refresh();
          loading.value = false;
          function?.call();
        }, failFunction: (error) {
          loading.value = false;
          ErrorHandler.manageError(error.errorCode, Get.currentRoute,
              moveRoute: Routes.reportDetailPage);
        });
      }
    }
  }

  ///
  /// Check Report
  ///
  RxBool checkLoading = false.obs;

  void checkReport(int inputWeek) async {
    if (!checkLoading.value) {
      checkLoading.value = true;
      await useCase.checkReport(inputWeek, service.round, successFunction: () {
        checkLoading.value = false;
        if (inputWeek == 8) {
          Get.offNamed(Routes.programEndPage);
        } else {
          service.move();
        }
      }, failFunction: (error) {
        checkLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }
}
