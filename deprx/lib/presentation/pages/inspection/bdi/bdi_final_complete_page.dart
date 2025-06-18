import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../../../core/service/procedure_service.dart';

class BDIFinalCompletePage extends StatefulWidget{
  BDIFinalCompletePage({super.key});

  @override
  State<StatefulWidget> createState() => _BDIFinalCompletePage();

}

class _BDIFinalCompletePage extends State<BDIFinalCompletePage> {

  final ProcedureService _service = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'letter_title'.tr;

  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.bdiFinalCompletePage);
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
                  padding: EdgeInsets.only(top: _screenUtil.topPadding + 66),
                  child: DpTitle(title: _title),
                ),
                Center(
                  child: Resource.lottiAnimation('letter_animation',
                      width: 200, height: 200, boxFit: BoxFit.fitWidth),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 79),
                  child: DPbutton(
                      text: 'letter_ctaBtn'.tr,
                      function: () {
                        GAUtil.trackEvent(name: GAEventList.READ_LETTER_BUTTON_CLICK);
                        _service.isJoinedFinalBDI.value = true;
                        _service.getProcedure(successFunction: (value) {
                          Get.offAllNamed(Routes.mainPage);
                        }, failFunction: () {
                          ToastHandler().showExceptionError();
                        });
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
