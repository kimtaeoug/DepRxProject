import 'package:common/common.dart';
import 'package:common/component/common/dp_expended_spacer.dart';
import 'package:common/component/common/dp_title.dart';
import 'package:common/component/feature/diary/dp_diary_text_field.dart';
import 'package:core/core.dart';
import 'package:core/types/diary/diary_type.dart';
import 'package:core/utils/ui_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/colors.dart';
import 'package:resource/screen_util.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';

class TodayDiaryPage extends StatefulWidget {
  const TodayDiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _TodayDiaryPage();
}

class _TodayDiaryPage extends State<TodayDiaryPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryController diaryController = Get.find();
  final TextEditingController _editingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final DiaryType type = DiaryType.td;
  int textLength = 0;
  bool alreadyEnter = false;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.todayDiary);
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
        canPop: true,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
          }
        },
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
                BackAppBar(),
                GestureDetector(
                  onTap: () {
                    UIUtil.closeKeyBoard();
                  },
                  child: Container(
                    width: _screenUtil.width,
                    color: DColors.transparent,
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: DpTitle(
                      title: type.title,
                      padding: _screenUtil.defaultHorizontalMargin,
                      needPadding: false,
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
                DPExpendedSpacer(width: _screenUtil.width)
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
            diaryController.contents.value = _editingController.text;
            diaryController.saveTd();
          }
        });
      });
    }
  }
}
