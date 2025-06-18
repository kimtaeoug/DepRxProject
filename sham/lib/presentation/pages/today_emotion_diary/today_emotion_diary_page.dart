import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/core/sham_life_cycle_handler.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';

class TodayEmotionDiaryPage extends StatefulWidget {
  TodayEmotionDiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _TodayEmotionDiaryPage();
}

class _TodayEmotionDiaryPage extends State<TodayEmotionDiaryPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryController diaryController = Get.find();
  final TextEditingController _editingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final DiaryType type = DiaryType.ted;
  int textLength = 0;
  bool alreadyEnter = false;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.todayEmotionDiary, isDeprx: false);
    super.initState();
    _editingController.addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _editingController.removeListener(_listener);
    _editingController.dispose();
    focusNode.dispose();
    super.dispose();
    UIUtil.closeKeyBoard();
  }

  void _listener() {
    if (!alreadyEnter) {
      setState(() {
        alreadyEnter = true;
      });
    }
    setState(() {
      textLength = _editingController.text.length;
    });
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    UIUtil.closeKeyBoard();
                  },
                  child: Container(
                    width: _screenUtil.width,
                    color: DColors.transparent,
                    padding: EdgeInsets.only(
                        top: _screenUtil.topPadding + 36, bottom: 16),
                    child: DpTitle(
                      title: type.title,
                    ),
                  ),
                ),
                SizedBox(
                  width: _screenUtil.width,
                  child: DpDiaryTextField(
                    controller: _editingController,
                    onChanged: (value) {
                      if (value != null) {
                        if (!alreadyEnter) {
                          setState(() {
                            alreadyEnter = true;
                          });
                        }
                        // widget.onChanged(value);
                      }
                    },
                    hintText: type.hintText,
                    minLength: type.minLength,
                    maxLength: type.maxLength,
                    length: textLength,
                    focusNode: focusNode,
                    onTap: () {
                      focusNode.requestFocus();
                    },
                    onSubmitted: (_) {
                      btnFunction();
                    },
                    errorText: DiaryTypeExtension.errorText(
                        type, textLength, alreadyEnter),
                    btnFunction: btnFunction,
                    passCondition: passCondition(),
                  ),
                ),

                // DPExpendedSpacer(width: _screenUtil.width)
              ],
            ),
          ),
        ));
  }

  bool passCondition() => DiaryTypeExtension.passCondition(type, textLength);

  void btnFunction() {
    if (passCondition()) {
      DiaryTypeExtension.showDialog(rightFunction: () async {
        await Get.toNamed(Routes.diaryCompletePage, arguments: {
          'move': () {
            diaryController.emotion.value = _editingController.text;
            diaryController.saveTed();
          }
        });
      });
    }
  }
}
