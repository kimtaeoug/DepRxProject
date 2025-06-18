import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/alpha_data/alpha_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';


///
/// 10종 가치 + 알파데이터
///
class AlphaDataPage extends StatefulWidget {
  const AlphaDataPage({super.key});

  @override
  State<StatefulWidget> createState() => _AlphaDataPage();
}

class _AlphaDataPage extends State<AlphaDataPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final AlphaDataController _controller = Get.find();
  late final PageController _pageController = PageController(initialPage: 0);

  int currentIdx = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.alphaData);
    _controller.makeWidgetList(() {
      move();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            move(isForward: false);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: _screenUtil.width,
              height: _screenUtil.height,
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _screenUtil.topPadding + 28,
                    ),
                    DPProgressBar(
                      value: currentIdx + 1,
                      totalLength: _controller.frameList.length,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BackAppBar(
                      needTopPadding: false,
                      needCloseKeyboard: true,
                      backFunction: () {
                        move(isForward: false);
                      },
                      isDeprx: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: SizedBox(
                          width: _screenUtil.width,
                          // height: _screenUtil.height - _screenUtil.topPadding - 108,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: _controller.frameList,
                            onPageChanged: (idx) {
                              setState(() {
                                currentIdx = idx;
                              });
                            },
                          ),
                        ))
                  ],
                );
              })),
        ));
  }

  final Duration _duration = const Duration(milliseconds: 200);

  void move({bool isForward = true}) async {
    if (isForward) {
      UIUtil.closeKeyBoard();
      if (currentIdx != _controller.frameList.length - 1) {
        currentIdx += 1;
        await _pageController.animateToPage(currentIdx,
            duration: _duration, curve: Curves.linear);
      } else {
        Get.toNamed(Routes.signUpComplete);
      }
    } else {
      UIUtil.closeKeyBoard();
      if (currentIdx == 0) {
        Get.back();
      } else {
        currentIdx -= 1;
        await _pageController.animateToPage(currentIdx,
            duration: _duration, curve: Curves.linear);
      }
    }
    _controller.moveLoading.value = false;
  }
}
