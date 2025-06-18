import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';

import '../../../../core/service/procedure_service.dart';

class LeaveCompletePage extends StatefulWidget{
  LeaveCompletePage({super.key});
  @override
  State<StatefulWidget> createState() => _LeaveCompletePage();

}

class _LeaveCompletePage extends State<LeaveCompletePage> {

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor);

  final String _title = 'userDeleteComplete_overview_title'.tr;
  final String _subTitle = 'userDeleteComplete_overview_subtitle'.tr;

  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.leaveComplete);
    super.initState();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 56,
                      ),
                      SizedBox(
                        width: _screenUtil.width,
                        child: Text(
                          _title,
                          style: _titleStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: _screenUtil.width,
                        child: Text(
                          _subTitle,
                          style: _subTitleStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 73),
                  child: DPbutton(
                      text: 'common_ctaBtn_confirm'.tr,
                      function: () {
                        Get.find<ProcedureService>().clearData();
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
