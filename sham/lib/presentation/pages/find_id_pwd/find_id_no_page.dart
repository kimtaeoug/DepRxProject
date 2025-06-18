import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class FindIdNoPage extends StatefulWidget {
  FindIdNoPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindIdNoPage();
}

class _FindIdNoPage extends State<FindIdNoPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _textStyle =
      DpTextStyle.h4.style.copyWith(fontWeight: FontWeight.w700);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.findIdNo, isDeprx: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (value, _) async {
          if (!value) {
            await Get.offAllNamed(Routes.baseLogin);
          }
        },
        child: Scaffold(
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleAppBar(
                  title: 'common_findId'.tr,
                  notShowBack: true,
                  isDeprx: true,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Text(
                    '회원님의 아이디를 찾을 수 없습니다.',
                    style: _textStyle,
                  ),
                ),
                DPbutton(
                    text: 'common_ctaBtn_confirm'.tr,
                    function: () async {
                      await Get.offAllNamed(Routes.baseLogin);
                    })
              ],
            ),
          ),
        ));
  }
}
