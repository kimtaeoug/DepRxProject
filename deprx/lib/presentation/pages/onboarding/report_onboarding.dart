import 'package:common/common.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class ReportOnboardingPage extends StatefulWidget {
  final ReportModel? reportData = Get.arguments?['data'] as ReportModel?;
  final bool? onProcedure = Get.arguments?['onProcedure'] as bool?;
  final bool? isFromGuide = Get.arguments?['isFromGuide'] as bool?;

  ReportOnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReportOnboardingPage();
}

class _ReportOnboardingPage extends State<ReportOnboardingPage>
    with WidgetsBindingObserver {
  final ScreenUtil _screenUtil = ScreenUtil();
  final OnBoardingItemModel data = OnBoardingItemModel(
      title: 'reportOnboarding_overview_title'.tr,
      contents: 'reportOnboarding_overview_subtitle'.tr,
      imgPath: 'report_onboarding_1');
  final PrefUtil spUtil = PrefUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.reportOnboarding);
    if (Get.previousRoute == Routes.splash) {
      SplashUtil.preWord();
    }
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: OnBoardingItem(data: data, function: () {}),
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            width: _screenUtil.width,
                            height: 54,
                            color: DColors.white,
                            child: DPbutton(
                                text: 'common_ctaBtn_next'.tr,
                                function: () async {
                                  spUtil.saveReportOnBoarding(true);
                                  if (widget.reportData != null ||
                                      widget.onProcedure == true) {
                                    GAUtil.trackEvent(
                                        name:
                                            GAEventList.REPORT_ONBOARDING_COMPLETE);
                                    if (widget.reportData != null) {
                                      await Get.offNamed(
                                          Routes.reportDetailPage,
                                          arguments: {
                                            'data': widget.reportData
                                          });
                                    } else {
                                      await Get.offNamed(
                                          Routes.reportDetailPage);
                                    }
                                  } else {
                                    Get.back();
                                  }
                                }),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
