import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class AlphaDataCompletePage extends StatefulWidget {
  const AlphaDataCompletePage({super.key});

  @override
  State<StatefulWidget> createState() => _AlphaDataCompletePage();
}

class _AlphaDataCompletePage extends State<AlphaDataCompletePage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  late final AnimationController _controller = AnimationController(vsync: this);
  final PrefUtil spUtil = PrefUtil();
  String name = '';

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.alphaDataComplete);
    super.initState();
    _controller.addStatusListener(_statusListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String savedName = spUtil.userName;
      if (savedName != '') {
        setState(() {
          name = savedName;
        });
      }
    });
  }

  void _statusListener(AnimationStatus value) {
    if (value == AnimationStatus.completed) {
      Get.offNamed(Routes.bdiSelectPage);
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }

  final TextStyle _titleStyle = DpTextStyle.h3.style;

  Widget _title({bool needTransparent = false}) {
    return Text(
      '${name != '' ? name : '사용자'}${'signUpDone_overview_title'.tr}',
      style: _titleStyle.copyWith(
          color:
              needTransparent ? DColors.transparent : DColors.labelNormalColor),
      textAlign: TextAlign.center,
    );
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
                Center(
                  child: SizedBox(
                    width: _screenUtil.width,
                    height: _screenUtil.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _title(),
                        _title(needTransparent: true),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Resource.lottiAnimationWithController(
                      'complete_animation', _controller,
                      width: _screenUtil.width),
                )
              ],
            ),
          ),
        ));
  }
}
