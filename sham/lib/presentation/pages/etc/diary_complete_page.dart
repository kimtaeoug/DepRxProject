import 'package:common/common.dart';
import 'package:common/component/common/button/dp_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class DiaryCompletePage extends StatelessWidget {
  final Function()? moveFunction = Get.arguments?['move'] as Function()?;

  DiaryCompletePage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

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
                Expanded(child: Center(
                  child: DiaryCompleteContainer(),
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 49),
                  child: DPbutton(
                      text: 'common_ctaBtn_confirm'.tr,
                      function: () {
                        if (moveFunction != null) {
                          moveFunction?.call();
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
