import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class MyTermPage extends StatefulWidget{
  MyTermPage({super.key});
  @override
  State<StatefulWidget> createState() => _MyTermPage();
}

class _MyTermPage extends State<MyTermPage> {
  final MyPageController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final List<TermType> _termList = TermType.values;

  @override 
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.myTerm);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleAppBar(
                  title: 'myPageMain_arrowCell_policy'.tr,
                  isDeprx: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyPageItemContainer(
                    widgetList: _termList.map((e) {
                  TermModel data = _controller.termData[e] ?? const TermModel();
                  return MyPageItem(
                      title: e.label,
                      function: () {
                        DPBottomSheet.showMyPageSheet(data.title, data.contents,
                            isPrivacyConsent: e == TermType.privacyConsent);
                      });
                }).toList())
              ],
            ),
          ),
        ));
  }
}
