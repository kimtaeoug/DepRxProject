import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

import '../../controllers/library/library_controller.dart';

class CurriculumDetailPage extends StatefulWidget{
  CurriculumDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _CurriculumDetailPage();

}

class _CurriculumDetailPage extends State<CurriculumDetailPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);

  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.curriculumDetail, isDeprx: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, child) {
          if (!value) {
            Get.back();
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Padding(
              padding: EdgeInsets.only(top: _screenUtil.topPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BackAppBar(needTopPadding: false),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 24, right: 24, bottom: 20),
                      child: Text(
                        'common_curriculum_overview_title'.tr,
                        style: _titleStyle,
                      ),
                    ),
                    GetBuilder<LibraryController>(builder: (controller) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            controller.curriMap.length, (idx) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 20),
                            child: CurriculumDetailItem(
                                data: controller.curriMap[idx+1] ?? const CurriculumItemModel()),
                          );
                        }),
                      );
                    }),
                    const SizedBox(
                      height: 42,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
