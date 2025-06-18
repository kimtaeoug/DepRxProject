import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class BackAppBar extends StatelessWidget {
  bool needTopPadding;
  bool needCloseKeyboard;
  final Function()? backFunction;
  final bool showBack;
  final bool isDeprx;
  BackAppBar(
      {super.key,
      this.needTopPadding = true,
      this.needCloseKeyboard = false,
      this.backFunction,
      this.showBack = true,
      this.isDeprx = false});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: EdgeInsets.only(top: needTopPadding ? _screenUtil.topPadding : 0),
      color: DColors.transparent,
      child: SizedBox(
        width: _screenUtil.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _back(context),
            Expanded(
                child: GestureDetector(
              onTap: () {
                if (needCloseKeyboard) {
                  UIUtil.closeKeyBoard();
                }
              },
              child: Container(
                height: 20,
                color: DColors.transparent,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _back(BuildContext context) {
    if (showBack) {
      return GestureDetector(
        onTap: () {
          if(isDeprx){
            GAUtil.trackBack();
          }
          if (backFunction != null) {
            backFunction?.call();
          } else {
            Get.back();
          }
        },
        child: Container(
          height: 52,
          color: DColors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: _screenUtil.svgIcon('$ICON_PATH/ic_arrow_left_sharp.svg'),
          ),
        ),
      );
    } else {
      return Container(
        width: 24,
        height: 52,
        color: DColors.transparent,
      );
    }
  }
}
