import 'package:core/config/ga_value_list.dart';
import 'package:core/utils/bdi_loading_util.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/inspection/bdi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class BDILoadingPage extends StatefulWidget {
  bool? isFinal = Get.arguments?['isFinal'] as bool?;

  BDILoadingPage({super.key});

  @override
  State<StatefulWidget> createState() => _BDILoadingPage();
}

class _BDILoadingPage extends State<BDILoadingPage> with WidgetsBindingObserver{
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h2.style.copyWith(color: DColors.labelNormalColor);
  final BDIController controller = Get.find();
  final BDIUtil bdiUtil = BDIUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.bdiLoading);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.bdiComplete.listen(_listener);
    });
  }

  void _listener(bool value) {
    if (value) {
      if (widget.isFinal == true) {
        Get.offNamed(Routes.bdiFinalCompletePage);
      } else {
        GAUtil.trackEvent(name: GAEventList.BDI_AUTO_LOADING_COMPLETE, params: {
          GAParameter.SUCCESS : 'true'
        });
        Get.offNamed(Routes.bdiAutoCompletePage);
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.BDI_AUTO_LOADING_EXIT, params: {
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    controller.bdiComplete.close();
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
                Resource.image('reward_bg',
                    width: _screenUtil.width, height: _screenUtil.height),
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: DColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Center(
                            child: Resource.lottiAnimation('loading',
                                width: 80, height: 80, boxFit: BoxFit.fitWidth),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'inspectionWait_overview_title'.tr,
                          style: _titleStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
