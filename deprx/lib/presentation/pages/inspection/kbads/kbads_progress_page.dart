import 'package:common/common.dart';
import 'package:core/config/ga_value_list.dart';
import 'package:core/core.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/inspection/kbads_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class KBADSProgressPage extends StatefulWidget {
  final bool? rsi = Get.arguments?['rsi'] as bool?;

  KBADSProgressPage({super.key});

  @override
  State<StatefulWidget> createState() => _KBADSProgressPage();
}

class _KBADSProgressPage extends State<KBADSProgressPage>
    with WidgetsBindingObserver {
  final ScreenUtil _screenUtil = ScreenUtil();
  final KBADSController _controller = Get.find();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIdx = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.kbadsProgress);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.KBADS_QUESTION_EXIT, params: {
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            _move(isForward: false);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Obx(() {
              List<String> dataList = _controller.kbadsList;
              return Stack(
                children: [
                  SizedBox(
                    width: _screenUtil.width,
                    height: _screenUtil.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 28 + _screenUtil.topPadding,
                        ),
                        DPProgressBar(
                          value: _currentIdx + 1,
                          totalLength: dataList.length,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BackAppBar(
                          backFunction: () {
                            _move(isForward: false);
                          },
                          needTopPadding: false,
                          isDeprx: true,
                        ),
                        Expanded(
                            child: PageView.builder(
                                controller: _pageController,
                                itemCount: dataList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                padEnds: false,
                                pageSnapping: false,
                                itemBuilder: (context, idx) {
                                  return InspectionItemFrame(
                                    title: dataList[idx],
                                    pageIdx: idx + 1,
                                    clickFunction: (value) {
                                      GAUtil.trackEvent(
                                          name: GAEventList.KBADS_QUESTION_RESPONSE,
                                          params: {
                                            GAParameter.QUESTION_ID:
                                                _currentIdx,
                                            GAParameter.RESPONSE_VALUE: value
                                          });
                                      _controller.clickFunction(
                                          _currentIdx, value);
                                      _move();
                                    },
                                    isClicked: (value, pageIdx) {
                                      return _controller.checkValue(
                                          value, pageIdx);
                                    },
                                  );
                                }))
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }

  final Duration _duration = const Duration(milliseconds: 200);

  void _move({bool isForward = true}) {
    if (isForward) {
      if (_currentIdx < _controller.kbadsList.length) {
        setState(() {
          _currentIdx += 1;
        });
        GAUtil.trackEvent(
            name: GAEventList.KBADS_QUESTION_VIEW,
            params: {GAParameter.QUESTION_ID: _currentIdx - 1});
      }
    } else {
      if (_currentIdx == 0) {
        _controller.clearValueList();
        Get.back();
      } else {
        setState(() {
          _currentIdx -= 1;
        });
        GAUtil.trackEvent(
            name: GAEventList.KBADS_QUESTION_EXIT,
            params: {GAParameter.QUESTION_ID: _currentIdx + 1});
      }
    }
    if (_controller.kbadsList.length == _currentIdx) {
      GAUtil.trackEvent(name: GAEventList.KBADS_COMPLETION_POPUP_VIEW, params: {
        GAParameter.SCREEN_NAME : Get.currentRoute
      });
      showDialog();
    } else {
      Future.delayed(
              isForward ? const Duration(milliseconds: 100) : Duration.zero)
          .whenComplete(() {
        _pageController.animateToPage(_currentIdx,
            duration: _duration, curve: Curves.linear);
      });
    }
  }

  final DPDialog dialog = DPDialog();
  final String title = 'kbadsProgress_dialog_title'.tr;
  final String subTitle = 'kbadsProgress_dialog_subtitle'.tr;

  void showDialog() {
    dialog.showTitleWithSubtitle(
        title,
        subTitle,
        () {
          GAUtil.trackEvent(name: GAEventList.KBADS_SUBMIT_CONFIRM_CLICK);
          _controller.completeKBADS(rsi: widget.rsi);
        },
        leftText: 'kbadsProgress_dialog_cancelBtn'.tr,
        leftFunction: () {
          GAUtil.trackEvent(name: GAEventList.KBADS_SUBMIT_CANCEL_CLICK);
          setState(() {
            _currentIdx -= 1;
          });
          Get.back();
        });
  }
}
