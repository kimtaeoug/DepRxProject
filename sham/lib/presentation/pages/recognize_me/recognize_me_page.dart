import 'package:api/api.dart';
import 'package:common/component/common/appbar/back_app_bar.dart';
import 'package:common/component/common/dp_progress_bar.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';
import 'package:sham/presentation/pages/recognize_me/recognize_me_frame.dart';

class RecognizeMePage extends StatefulWidget {
  final int? week = Get.arguments?['week'] as int?;
  final RecognizeMeDataEntity? data =
      Get.arguments?['data'] as RecognizeMeDataEntity?;

  RecognizeMePage({super.key});

  @override
  State<StatefulWidget> createState() => _RecognizeMePage();
}

class _RecognizeMePage extends State<RecognizeMePage>
    with WidgetsBindingObserver {
  final DiaryController diaryController = Get.find();
  final DiaryController controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  int currentIdx = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rm, isDeprx: false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Rx<RecognizeMeDataEntity> dataList = controller.recogData;
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (value, _){
            _move(back: true);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: DColors.bgLightGray,
            body: SizedBox(
              width: _screenUtil.width,
              height: _screenUtil.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _screenUtil.topPadding + 28,
                  ),
                  DPProgressBar(
                    value: currentIdx + 1,
                    totalLength: dataList.value.data.length,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BackAppBar(
                    needTopPadding: false,
                    needCloseKeyboard: true,
                    backFunction: () {
                      _move(back: true);
                    },
                    showBack: currentIdx != 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    width: _screenUtil.width,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      pageSnapping: false,
                      children:
                          List.generate(dataList.value.data.length, (idx) {
                        RecognizeMeItemEntity data = dataList.value.data[idx];
                        return RecognizeMeFrame(
                          data: data,
                          move: _move,
                          onChanged: (value) {
                            controller.savedRecogData[idx] = value;
                          },
                          writtenData: controller.savedRecogData[idx],
                        );
                      }),
                      onPageChanged: (idx) {
                        setState(() {
                          currentIdx = idx;
                        });
                      },
                    ),
                  ))
                ],
              ),
            ),
          ));
    });
  }

  void _move({bool back = false}) {
    int length = controller.recogData.value.data.length;
    if (back) {
      if (currentIdx != 0) {
        setState(() {
          currentIdx -= 1;
        });
        UIUtil.closeKeyBoard();
        _animate(currentIdx);
      }
    } else {
      if (currentIdx == length - 1) {
        DiaryTypeExtension.showDialog(rightFunction: () async {
          await Get.toNamed(Routes.diaryCompletePage, arguments: {
            'move': () {
              diaryController.saveRm();
            }
          });
        });
      } else {
        UIUtil.closeKeyBoard();
        setState(() {
          currentIdx += 1;
        });
        _animate(currentIdx);
      }
    }
  }

  void _animate(int page) {
    _pageController.animateToPage(page,
        duration: _screenUtil.duration300, curve: Curves.linear);
  }
}
