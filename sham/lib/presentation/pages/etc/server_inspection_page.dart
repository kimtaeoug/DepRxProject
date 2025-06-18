import 'dart:io';
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ServerInspectionPage extends StatelessWidget {
  ServerInspectionPage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'serverCheck_serverGuide_title'.tr;
  final String _timeSubFix = 'patientAuth_serverGuide_subTitle_onlyText'.tr;

  final TextStyle _titleStyle =
  DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);
  final RemoteConfigHandler _configHandler = RemoteConfigHandler();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: DColors.bgBlueColor,
        body: SizedBox(
          width: _screenUtil.width,
          height: _screenUtil.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 66 + _screenUtil.topPadding, bottom: 57),
                    child: Container(
                      width: _screenUtil.width,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _screenUtil.width,
                            child: Text(
                              _title,
                              style: _titleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: _screenUtil.width,
                            child: Text(
                              '${_configHandler.configData.serverInspectionTime} $_timeSubFix',
                              style: _subTitleStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Resource.image('image_server_inspection',
                      width: 231, boxFit: BoxFit.fitWidth)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 79),
                child: DPbutton(
                    text: 'serverCheck_ctaBtn_useLater'.tr,
                    function: () {
                      if (Platform.isIOS) {
                        exit(0);
                      } else {
                        SystemNavigator.pop();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
