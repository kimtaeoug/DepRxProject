import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class FindIdSocialFrame extends StatelessWidget {
  final Function() moveFunction;
  final String socialType;

  FindIdSocialFrame(
      {super.key, required this.moveFunction, required this.socialType});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                DpTitle(
                  title: title,
                  subTitle: subTitle,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 41),
                  child: DPbutton(
                      text: 'common_ctaBtn_confirm'.tr, function: moveFunction),
                )
              ],
            ),
          ),
        ));
  }
  String get title{
    switch(socialType){
      case 'google':
        return 'findIdComplete_overview_title_google'.tr;
      case 'apple':
        return 'findIdComplete_overview_title_apple'.tr;
      case 'naver':
        return 'findIdComplete_overview_title_naver'.tr;
      case 'kakao':
        return 'findIdComplete_overview_title_kakao'.tr;
      default:
        return '';
    }
  }
  String get subTitle{
    switch(socialType){
      case 'google':
        return 'findIdComplete_overview_subtitle_google'.tr;
      case 'apple':
        return 'findIdComplete_overview_subtitle_apple'.tr;
      case 'naver':
        return 'findIdComplete_overview_subtitle_kakao'.tr;
      case 'kakao':
        return 'findIdComplete_overview_subtitle_naver'.tr;
      default:
        return '';
    }
  }
}
