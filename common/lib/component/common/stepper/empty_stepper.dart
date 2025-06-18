import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'stepper_title.dart';
import 'unopened_stepper_container.dart';

class EmptyStepper extends StatelessWidget {
  final int? week;
  final bool showedRewardOnboarding;
  final Function() routeFunction;

  EmptyStepper({super.key,this.week, this.showedRewardOnboarding = false, required this.routeFunction});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _screenUtil.defaultHorizontalMargin,
      padding: _screenUtil.defaultAllMargin,
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20, color: DColors.bgBlueColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StepperTitle(
              title: 'main_rewardStepper_title'.tr,
              function: () {
                routeFunction();
                // if (function != null) {
                //   //todo
                //   // Get.toNamed(Routes.rewardStoragePage);
                // } else {
                //   if (!showedRewardOnboarding) {
                //     //todo
                //     // Get.toNamed(Routes.rewardMainPage);
                //   } else {
                //     //todo
                //     // Get.toNamed(Routes.rewardOnboardingPage);
                //   }
                // }
              }),
          const SizedBox(
            height: 20,
          ),
          UnOpenedStepperContainer(week: week ?? 1)
        ],
      ),
    );
  }
}
