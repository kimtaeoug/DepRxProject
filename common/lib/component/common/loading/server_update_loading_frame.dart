import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource.dart';
import 'package:resource/screen_util.dart';

class ServerUpdateLoadingFrame extends StatelessWidget {
  final Function() doneFunction;
  final bool isLoading;

  ServerUpdateLoadingFrame(
      {super.key, required this.doneFunction, this.isLoading = true});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _loading();
    } else {
      return _done();
    }
  }

  Widget _loading() {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 80 + _screenUtil.topPadding),
                child: DpTitle(
                  title: 'serverUpdate_overview_title'.tr,
                  subTitle: 'serverUpdate_overview_subtitle'.tr,
                ),
              )),
          Center(
            child: Resource.lottiAnimation('loading',
                boxFit: BoxFit.fitWidth, width: 120),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: DPbutton(
                  text: 'common_ctaBtn_confirm'.tr,
                  function: () {},
                  isEnabled: false,
                ),
              ))
        ],
      ),
    );
  }

  Widget _done() {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 80 + _screenUtil.topPadding),
                child: DpTitle(
                  title: 'changedDate_overview_title'.tr,
                  subTitle: 'changedDate_overview_subtitle'.tr,
                ),
              )),
          Center(
            child: Resource.image('main_motion_10', width: 200, height: 200),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: DPbutton(
                  text: 'common_ctaBtn_confirm'.tr,
                  function: doneFunction,
                ),
              ))
        ],
      ),
    );
  }
}
