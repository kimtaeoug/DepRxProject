import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:deprx/core/service/procedure_service.dart';
import 'package:get/get.dart';

class EmotionController extends GetxController {
  final TodayEmotionUseCase useCase;
  final RewardUseCase rewardUseCase;

  EmotionController(this.useCase, this.rewardUseCase);

  RxBool loading = false.obs;
  final ProcedureService service = Get.find();

  void completeTodayEmotion(int emotionValue) async {
    if (!loading.value) {
      loading.value = true;
      await useCase.completeTodayEmotion(emotionValue, successFunction: () {
        checkStamp();
      }, failFunction: (error) {
        Log.e(error);
        loading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  void move(bool showArrow, int currentValue) {
    try {
      if (showArrow == false) {
        if (!loading.value) {
          completeTodayEmotion(currentValue);
        }
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  //rewardUseCase
  void checkStamp() async {
    await rewardUseCase.getStampReward(service.round, successFunction: (data) {
      if (data.isNotEmpty) {
        loading.value = false;
        Get.offNamed(Routes.rewardReceiveStampPage, arguments: {
          'data': data,
          'function': () {
            service.getProcedure(
                successFunction: (response) {
                  service.move();
                },
                failFunction: () {
                  ToastHandler().showExceptionError();
                });
            // service.getProcedure(
            //     successFunction: (response) {
            //       service.move();
            //     },
            //     failFunction: () {
            //       ToastHandler().showExceptionError();
            //     },
            //     recursionFlag: false);
          }
        });
      } else {
        loading.value = false;
        service.getProcedure(
            successFunction: (response) {
              service.move();
            },
            failFunction: () {
              ToastHandler().showExceptionError();
            });
        // service.getProcedure(
        //     successFunction: (response) {
        //       service.move();
        //     },
        //     failFunction: () {
        //       ToastHandler().showExceptionError();
        //     },
        //     recursionFlag: false);
      }
    }, failFunction: (error) {
      loading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }
}
