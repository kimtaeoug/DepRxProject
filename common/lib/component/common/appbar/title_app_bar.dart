import 'package:core/utils/ga_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class TitleAppBar extends StatelessWidget {
  final String title;
  final Function()? backFunction;
  final bool notShowBack;
  final bool needTopPadding;
  final bool isWhite;
  final bool isDeprx;

  TitleAppBar({super.key,
    required this.title,
    this.backFunction,
    this.notShowBack = false,
    this.needTopPadding = true,
    this.isWhite = false,
    this.isDeprx = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle = DpTextStyle.h6.style.copyWith(
      color: DColors.black, height: 1.445, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: EdgeInsets.only(top: needTopPadding ? _screenUtil.topPadding : 0),
      color: DColors.transparent,
      child: SizedBox(
        width: _screenUtil.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            !notShowBack
                ? GestureDetector(
              onTap: () {
                if (isDeprx) {
                  GAUtil.trackBack();
                }
                if (backFunction != null) {
                  backFunction?.call();
                } else {
                  Navigator.pop(context);
                }
              },
              child: SizedBox(
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: _screenUtil.svgIcon(
                      '$ICON_PATH/ic_arrow_left_sharp.svg',
                      colorFilter: isWhite
                          ? const ColorFilter.mode(
                          DColors.white, BlendMode.srcIn)
                          : null),
                ),
              ),
            )
                : const SizedBox(
              width: 42,
              height: 52,
            ),
            Text(
              title,
              style: _titleStyle.copyWith(
                  color: isWhite ? DColors.white : DColors.black),
            ),
            const SizedBox(
              width: 42,
              height: 52,
            )
          ],
        ),
      ),
    );
  }
}
