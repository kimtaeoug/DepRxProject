import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/inspection/bdi_controller.dart';


class BDIAutoCompletePage extends StatefulWidget{
  BDIAutoCompletePage({super.key});

  @override
  State<StatefulWidget> createState() => _BDIAutoCompletePage();
}

class _BDIAutoCompletePage extends State<BDIAutoCompletePage> {
  final BDIController controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'inspectionComplete_overview_title'.tr;
  final String _subTitle = 'inspectionComplete_overview_subTitle'.tr;
  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.bdiAutoComplete, isDeprx: false);
    super.initState();
    controller.bdiComplete.listen(_listener);
  }
  void _listener(bool value){
    if(value){
      controller.service.move();
    }
  }
  @override
  void dispose(){
    controller.bdiComplete.close();
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
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 66 + _screenUtil.topPadding),
                        child: DpTitle(
                          title: _title,
                          subTitle: _subTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 79),
                        child: DPbutton(
                            text: 'common_ctaBtn_start'.tr,
                            function: controller.afterAutoComplete),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  if (controller.loading.value ||
                      controller.startLoading.value) {
                    return LoadingFrame();
                  } else {
                    return const SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ));
  }
}
