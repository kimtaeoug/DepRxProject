import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:core/utils/bdi_loading_util.dart';
import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class BDIController extends GetxController {
  final BDIUseCase useCase;

  BDIController(this.useCase);

  final ProcedureService service = Get.find();

  RxBool loading = false.obs;
  final BDIUtil _bdiUtil = BDIUtil();

  void waitBDI({bool? isFinal, Function()? finalFunction}) async {
    if (!loading.value) {
      loading.value = true;
      await useCase.waitBDI(successFunction: () async {
        loading.value = false;
        _bdiUtil.setCurrentBDILoadingPage(true);
        if (isFinal == true) {
          finalFunction?.call();
        } else {
          await Get.offNamed(Routes.bdiLoadingPage,
              arguments: {'isFinal': isFinal});
        }
      }, failFunction: (error) {
        loading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  void autoComplete(Function(ProcedureModel) successFunction,
      Function(dynamic) failFunction) async {
    if (!loading.value) {
      loading.value = true;
      await useCase.autoComplete(successFunction: (response) {
        loading.value = false;
        ProcedureService service = Get.find();
        service.setProcedure(response);
        successFunction(response);
      }, failFunction: (error) {
        loading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            errorFunction: (code) {
          failFunction(error);
        });
      });
    }
  }

  RxBool bdiComplete = false.obs;

  RxBool startLoading = false.obs;

  void afterAutoComplete() async {
    if (startLoading.value == false) {
      startLoading.value = true;
      await useCase.startProgram(successFunction: () {
        service.getProcedure(successFunction: (value) {
          startLoading.value = false;
          service.move();
        }, failFunction: () {
          startLoading.value = false;
          ToastHandler().showExceptionError();
        });
      }, failFunction: (error) {
        startLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }
}
