import 'package:common/common.dart';
import 'package:core/config/ga_value_list.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/inspection/kbads_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

///
/// K-BADS 검사 시작 페이지
///
class KBadsStartPage extends StatefulWidget {
  final bool? rsi = Get.arguments?['rsi'] as bool?;
  KBadsStartPage({super.key});

  @override
  State<StatefulWidget> createState() => _KBadsStartPage();
}

class _KBadsStartPage extends State<KBadsStartPage> with WidgetsBindingObserver{
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _titleStyle =
      DpTextStyle.h2.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _labelStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.primaryNormalColor);
  final String _label = 'kbadsIntro_kbadsGuide_length'.tr;
  final String _title = 'kbadsIntro_kbadsGuide_title'.tr;
  final String _subTitle = 'kbadsIntro_kbadsGuide_subTitle'.tr;

  final KBADSController _controller = Get.find();
  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.kbadsIntro);
    SplashUtil.preWord();
    _controller.initKBADSList();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.KBADS_INTRO_EXIT, params: {
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                Resource.image('k_bads_back',
                    width: _screenUtil.width, height: _screenUtil.height),
                Positioned(
                  top: _screenUtil.topPadding + 23,
                  right: 0,
                  child: Resource.image('k_bads_polygon',
                      width: 246, boxFit: BoxFit.fitWidth),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: _screenUtil.width,
                            child: Text(
                              _label,
                              style: _labelStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 2, bottom: 20),
                            child: Text(
                              _title,
                              style: _titleStyle,
                            ),
                          ),
                          Text(
                            _subTitle,
                            style: _subTitleStyle,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 53),
                      child: DPbutton(
                          text: 'common_ctaBtn_next'.tr,
                          function: () async {
                            GAUtil.trackEvent(name: GAEventList.KBADS_START_CLICK, params: {
                              GAParameter.BUTTON_NAME : 'start'
                            });
                            await Get.toNamed(Routes.kBADSProgress, arguments: {
                              'rsi' : widget.rsi
                            });
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
