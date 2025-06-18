import 'package:common/common.dart';
import 'package:core/config/ga_value_list.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/emotion/emotion_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class EmotionPage extends StatefulWidget {
  const EmotionPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmotionPage();
}

class _EmotionPage extends State<EmotionPage> with WidgetsBindingObserver {
  final EmotionController controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.ema);
    SplashUtil.preWord();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.MOOD_SELECTION_EXIT, params: {
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT,
            GAParameter.CONTEXT : 'ema'
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final String _title = 'ema_overview_title'.tr;
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.white);
  int _currentValue = 2;
  bool showArrow = true;

  void _onChanged(int value) {
    setState(() {
      if (showArrow) {
        showArrow = false;
      }
      _currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: Obx(() {
            return Stack(
              children: [
                Container(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  decoration:
                      const BoxDecoration(gradient: DColors.emotionGradient),
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            _title,
                            style: _titleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EmotionSlider(
                            currentValue: _currentValue,
                            onChanged: _onChanged,
                            showArrow: showArrow,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 66, top: 80),
                            child: DPbutton(
                              text: 'common_ctaBtn_next'.tr,
                              function: () {
                                controller.move(showArrow, _currentValue);
                              },
                              isEnabled: !showArrow,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                if (controller.service.loading) LoadingFrame()
              ],
            );
          }),
        ));
  }
}
