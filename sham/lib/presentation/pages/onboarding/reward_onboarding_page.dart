import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class RewardOnboardingPage extends StatefulWidget {
  final bool? isFromGuide = Get.arguments?['isFromGuide'] as bool?;

  RewardOnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _RewardOnboardingPage();
}

class _RewardOnboardingPage extends State<RewardOnboardingPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  final PrefUtil spUtil = PrefUtil();
  int currentIdx = 0;
  final List<OnBoardingItemModel> dataList = [
    OnBoardingItemModel(
        title: 'rewardOnboarding_overview_title1'.tr,
        contents: 'rewardOnboarding_overview_subTitle1'.tr,
        imgPath: 'reward_onboarding_1'),
    OnBoardingItemModel(
        title: '매일 일기를 하나씩 써보세요!',
        contents: '꾸준히 작성하면 최종 보상이 기다리고 있어요  ',
        imgPath: 'reward_onboarding_2_sham'),
    OnBoardingItemModel(
        title: 'rewardOnboarding_overview_title3'.tr,
        contents: 'rewardOnboarding_overview_subTitle3'.tr,
        imgPath: 'reward_onboarding_3')
  ];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rewardOnboarding, isDeprx: false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (widget.isFromGuide == true && value == false) {
            Get.back();
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: _screenUtil.width,
                    height: _screenUtil.height,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: dataList.length,
                        onPageChanged: (idx) {
                          setState(() {
                            currentIdx = idx;
                          });
                          if (idx <= currentIdx) {
                            if (widget.isFromGuide == true) {
                              GAUtil.trackEvent(
                                  name: GAEventList.ONBOARDING_SWIPE,
                                  params: {
                                    GAParameter.SCREEN_NAME: Get.currentRoute,
                                    GAParameter.DIRECTION: 'left',
                                    GAParameter.CONTEXT: 'userGuide'
                                  }, isDeprx: false);
                            } else {
                              GAUtil.trackEvent(
                                  name: GAEventList.ONBOARDING_SWIPE,
                                  params: {
                                    GAParameter.SCREEN_NAME: Get.currentRoute,
                                    GAParameter.DIRECTION: 'left',
                                  }, isDeprx: false);
                            }
                          } else {
                            if (widget.isFromGuide == true) {
                              GAUtil.trackEvent(
                                  name: GAEventList.ONBOARDING_SWIPE,
                                  params: {
                                    GAParameter.SCREEN_NAME: Get.currentRoute,
                                    GAParameter.DIRECTION: 'right',
                                    GAParameter.CONTEXT: 'userGuide'
                                  }, isDeprx: false);
                            } else {
                              GAUtil.trackEvent(
                                  name: GAEventList.ONBOARDING_SWIPE,
                                  params: {
                                    GAParameter.SCREEN_NAME: Get.currentRoute,
                                    GAParameter.DIRECTION: 'right'
                                  }, isDeprx: false);
                            }
                          }
                        },
                        itemBuilder: (context, idx) {
                          if(idx == 1){
                            return OnBoardingItem(
                                data: dataList[idx],
                                function: () {
                                  if (currentIdx != dataList.length - 1) {
                                    _pageController.animateToPage(currentIdx + 1,
                                        duration: _screenUtil.duration300,
                                        curve: Curves.linear);
                                  } else {
                                    if (widget.isFromGuide == true) {
                                      Get.back();
                                    } else {
                                      spUtil.saveRewardOnBoarding(true);
                                      Get.back();
                                    }
                                  }
                                });
                          }else{
                            return RewardOnBoardingItem(
                                idx: idx,
                                data: dataList[idx],
                                function: () {
                                  if (currentIdx != dataList.length - 1) {
                                    _pageController.animateToPage(currentIdx + 1,
                                        duration: _screenUtil.duration300,
                                        curve: Curves.linear);
                                  } else {
                                    if (widget.isFromGuide == true) {
                                      Get.back();
                                    } else {
                                      spUtil.saveRewardOnBoarding(true);
                                      Get.back();
                                    }
                                  }
                                });
                          }
                        }),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            DPbutton(
                                text: 'common_ctaBtn_next'.tr,
                                function: () {
                                  if (currentIdx != dataList.length - 1) {
                                    _pageController.animateToPage(currentIdx + 1,
                                        duration: _screenUtil.duration300,
                                        curve: Curves.linear);
                                  } else {
                                    if (widget.isFromGuide == true) {
                                      Get.back();
                                    } else {
                                      GAUtil.trackEvent(
                                          name: GAEventList
                                              .REWARD_ONBOARDING_COMPLETE, isDeprx: false);
                                      spUtil.saveRewardOnBoarding(true);
                                      Get.offNamed(Routes.rewardMainPage);
                                    }
                                  }
                                }),
                            Container(
                              width: _screenUtil.width,
                              height: 59,
                              color: DColors.white,
                            )
                          ],
                        )
                      ],
                    )),
                Positioned(
                    top: _screenUtil.topPadding,
                    right: 33,
                    child: SizedBox(
                      width: 20 + 8 * (2 * dataList.length - 1),
                      height: 60,
                      child: DPIndicator(
                          currentIdx: currentIdx, totalLength: dataList.length),
                    ))
              ],
            ),
          ),
        ));
  }
}
