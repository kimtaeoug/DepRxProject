import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';
import 'package:sham/presentation/pages/home/sham_attendance_check_container.dart';

import '../../controllers/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final HomeController _controller = Get.find();
  final DiaryController diaryController = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.main, isDeprx: false);
    if (_controller.isFinal) {
      _controller.getFinalReward();
      _controller.getBDIResult();
    } else {
      _controller.initAttendance();
      _controller.initStep();
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      diaryController.getProgramInfo();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final PrefUtil localDataUtil = PrefUtil();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Padding(
              padding: EdgeInsets.only(top: _screenUtil.topPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HomeAppBar(),
                    const SizedBox(
                      height: 6,
                    ),
                    HomeBanner(),
                    Obx(() {
                      Rx<BDIResultModel> bdiResult = _controller.bdiResult;
                      if (bdiResult.value.bdiResult != -1) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: (){
                              GAUtil.trackEvent(
                                  name: GAEventList.FINAL_VISIT_SUMMARY_VIEW,
                                  params: {
                                    GAParameter.CLICK_TIME: DateTime.now()
                                  }, isDeprx: false);
                            },
                            child: BDIResultContainer(
                              name: _controller.name.value,
                              finalReward: _controller.finalReward.value,
                              isBetter: bdiResult.value.bdiResult >= 0,
                            ),
                          ),
                        );
                      } else {
                        if (_controller.isFinal) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TryBDIContainer(
                              gaFunction: () {
                                GAUtil.trackEvent(
                                    name: GAEventList.FINAL_VISIT_INFO_CLICK,
                                    params: {
                                      GAParameter.CLICK_TIME: DateTime.now()
                                    }, isDeprx: false);
                              },
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }
                    }),
                    Obx(() {
                      Rx<FinalRewardModel> finalReward =
                          _controller.finalRewardValue;
                      if (finalReward.value != const FinalRewardModel() &&
                          (_controller.finalRewardLoading.value == false)) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              GAUtil.trackEvent(
                                  name: GAEventList.MAIN_SCREEN_FINAL_REWARD_CLICK,
                                  params: {
                                    GAParameter.REWARD_NAME:
                                    finalReward.value.contents,
                                    GAParameter.CLICK_TIME: DateTime.now()
                                  }, isDeprx: false);
                            },
                            child: RewardFinalCard(
                                imgPath: finalReward.value.imagePath,
                                header: finalReward.value.header,
                                content: finalReward.value.contents,
                                date: finalReward.value.date,
                                inCompleteReason: finalReward.value.why),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    Obx(() {
                      if (!_controller.isFinal) {
                        if (_controller.attendanceLoading.value) {
                          return AttendanceSkeleton();
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ShamAttendanceCheckContainer(
                                weekData: _controller.attendanceWeek.value,
                                dayList: _controller.attendanceList.value,
                                ttList: _controller.todayTaskList.value,
                                currentIdx: 0,
                                week: _controller.week,
                            ),
                          );
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    Obx(() {
                      if (!_controller.isFinal) {
                        if (_controller.stepLoading.value) {
                          return StepperSkeleton();
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: _controller.stepList.value.isEmpty
                                ? EmptyStepper(
                                    showedRewardOnboarding:
                                        localDataUtil.rewardOnboarding,
                                    routeFunction: () {
                                      if (localDataUtil.rewardOnboarding) {
                                        Get.toNamed(Routes.rewardMainPage);
                                      } else {
                                        Get.toNamed(
                                            Routes.rewardOnboardingPage);
                                      }
                                    },
                                  )
                                : StepContainer(
                                    dataList: _controller.stepList.value,
                                    routeFunction: () {
                                      if (localDataUtil.rewardOnboarding) {
                                        Get.toNamed(Routes.rewardMainPage);
                                      } else {
                                        Get.toNamed(
                                            Routes.rewardOnboardingPage);
                                      }
                                    },
                                  ),
                          );
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
