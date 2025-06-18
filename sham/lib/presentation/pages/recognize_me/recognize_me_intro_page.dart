import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';

class RecognizeMeIntroPage extends StatefulWidget {
  RecognizeMeIntroPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecognizeMeIntroPage();
}

class _RecognizeMeIntroPage extends State<RecognizeMeIntroPage> {
  final DiaryController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rmIntro, isDeprx: false);
    _controller.initRecogMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Obx(() {
              RxBool loading = _controller.loading;
              Rx<RecognizeMeDataEntity> data = _controller.recogData;
              if (loading.value) {
                return SmallLoadingFrame();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 93,
                    ),
                    RecognizeMeIntro(
                        week: _controller.week, contents: data.value.title),
                    Padding(
                      padding: EdgeInsets.only(bottom: 41),
                      child: DPbutton(
                          text: 'common_ctaBtn_next'.tr,
                          function: () {
                            Get.toNamed(Routes.rmPage, arguments: {
                              'week' : _controller.week,
                              'data' : data.value
                            });
                          }),
                    )
                  ],
                );
              }
            }),
          ),
        ));
  }
}
