import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class LeavePage extends StatefulWidget{
  LeavePage({super.key});

  @override
  State<StatefulWidget> createState() => _LeavePage();
}

class _LeavePage extends State<LeavePage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final MyPageController _controller = Get.find();

  final TextStyle _titleStyle = DpTextStyle.h5.style.copyWith(
    color: DColors.black,
  );
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _confirmStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);
  final String _title = 'userDelete_overview_title'.tr;
  final List<String> _subTitleList = [
    'userDelete_overview_subtitle1'.tr,
    'userDelete_overview_subtitle2'.tr,
    'userDelete_overview_subtitle3'.tr
  ];
  final MyPageController controller = Get.find();
  final DPDialog dialog = DPDialog();

  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.leaveMember);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
          }
        },
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleAppBar(
                      title: 'common_userDelete'.tr,
                      isDeprx: true,
                    ),
                    const SizedBox(
                      height: 47,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _title,
                          style: _titleStyle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_subTitleList.length, (idx) {
                        return _dotContainer(_subTitleList[idx],
                            isLast: idx == _subTitleList.length - 1);
                      }),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DPbutton(
                        text: 'userDelete_ctaBtn_stay'.tr,
                        function: () {
                          Get.back();
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 57),
                      child: DPOutlinedButton(
                          text: 'userDelete_ctaBtn_delete'.tr,
                          function: showDialog),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget _dotContainer(String input, {bool isLast = false}) {
    return SizedBox(
      width: _screenUtil.width - 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            ' · ',
            style: _subTitleStyle,
          ),
          Expanded(
              child: isLast
                  ? Text.rich(TextSpan(children: [
                      TextSpan(text: input, style: _subTitleStyle),
                      TextSpan(
                          text: '  ${'userDelete_seeTerm'.tr}',
                          style: _confirmStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              TermModel data = _controller
                                      .termData[TermType.privacyPolicy] ??
                                  const TermModel();
                              DPBottomSheet.showMyPageSheet(
                                  data.title, data.contents);
                            })
                    ]))
                  : Text(
                      input,
                      style: _subTitleStyle,
                    ))
        ],
      ),
    );
  }

  final String title = "userDeleteDialog_title".tr;
  final String contents = 'userDeleteDialog_subTitle'.tr;

  void showDialog() {
    dialog.showTitleWithSubtitle(title, contents,
        leftText: 'common_cancel'.tr,
        rightText: 'userDeleteDialog_confirmBtn'.tr, () {
      _controller.leave();
    });
  }
}
