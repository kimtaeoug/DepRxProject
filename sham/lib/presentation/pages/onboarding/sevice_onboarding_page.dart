import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';

import '../../../core/service/procedure_service.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
class ServiceOnboardingPage extends StatefulWidget {
  final bool? isFromGuide = Get.arguments?['isFromGuide'] as bool?;

  ServiceOnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _ServiceOnboardingPage();
}

class _ServiceOnboardingPage extends State<ServiceOnboardingPage> {
  final ProcedureService _service = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  int currentIdx = 0;
  final List<OnBoardingItemModel> dataList = [
    OnBoardingItemModel(
        title: 'serviceOnboarding_overview_title1'.tr,
        contents: 'serviceOnboarding_overview_subTitle1'.tr,
        imgPath: 'sham_service_onboarding_1'),
    OnBoardingItemModel(
        title: '우울증을 이해하고 배워요',
        contents: '퀴즈로 학습내용을 확인해요',
        imgPath: 'sham_service_onboarding_2'),
    OnBoardingItemModel(
        title: '감정과 생각을 기록하며 나를 돌아봐요',
        contents: '기록을 통해 스스로를 더 잘 이해할 수 있어요 ',
        imgPath: 'sham_service_onboarding_3'),
    OnBoardingItemModel(
        title: 'serviceOnboarding_overview_title2'.tr,
        contents: 'serviceOnboarding_overview_subTitle2'.tr,
        imgPath: 'sham_service_onboarding_4'),
  ];
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.serviceOnboarding, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isFromGuide == false || widget.isFromGuide == null) {
        SplashUtil.preWord();
      }
    });
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
                          if(idx <= currentIdx){
                            if(widget.isFromGuide == true){
                              GAUtil.trackEvent(name: GAEventList.ONBOARDING_SWIPE, params: {
                                GAParameter.SCREEN_NAME : Get.currentRoute,
                                GAParameter.DIRECTION : 'left',
                                GAParameter.CONTEXT : 'userGuide'
                              }, isDeprx: false);
                            }else{
                              GAUtil.trackEvent(name: GAEventList.ONBOARDING_SWIPE, params: {
                                GAParameter.SCREEN_NAME : Get.currentRoute,
                                GAParameter.DIRECTION : 'left',
                              }, isDeprx: false);
                            }
                          }else{
                            if(widget.isFromGuide == true){
                              GAUtil.trackEvent(name: GAEventList.ONBOARDING_SWIPE, params: {
                                GAParameter.SCREEN_NAME : Get.currentRoute,
                                GAParameter.DIRECTION : 'right',
                                GAParameter.CONTEXT : 'userGuide'
                              }, isDeprx: false);
                            }else{
                              GAUtil.trackEvent(name: GAEventList.ONBOARDING_SWIPE, params: {
                                GAParameter.SCREEN_NAME : Get.currentRoute,
                                GAParameter.DIRECTION : 'right'
                              }, isDeprx: false);
                            }
                          }
                        },
                        itemBuilder: (context, idx) {
                          return OnBoardingItem(
                              data: dataList[idx],
                              function: () {
                                if (currentIdx != dataList.length - 1) {
                                  _pageController.animateToPage(currentIdx + 1,
                                      duration: _duration,
                                      curve: Curves.linear);
                                } else {
                                  if (widget.isFromGuide == true) {
                                    Get.back();
                                  } else {
                                    PrefUtil().saveServiceOnBoarding(true);
                                    Get.toNamed(Routes.socialLogin);
                                  }
                                }
                              });
                        }),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: _screenUtil.width,
                      color: DColors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 59),
                        child: SizedBox(
                          width: _screenUtil.width,
                          height: 54,
                          child: DPbutton(
                              text: 'common_ctaBtn_next'.tr,
                              function: () {
                                if (currentIdx != dataList.length - 1) {
                                  _pageController.animateToPage(currentIdx + 1,
                                      duration: _duration,
                                      curve: Curves.linear);
                                } else {
                                  if (widget.isFromGuide == true) {
                                    Get.back();
                                  } else {
                                    PrefUtil().saveServiceOnBoarding(true);
                                    if (_service.accessToken.isNotEmpty) {
                                      _service.move();
                                    } else {
                                      Get.offNamed(Routes.socialLogin);
                                    }
                                  }
                                }
                              }),
                        ),
                      ),
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
