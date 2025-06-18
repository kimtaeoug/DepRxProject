import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resource/resource_manager.dart';

class DiaryEmptyPage extends StatelessWidget {
  DiaryEmptyPage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  final String _text = '기록이 없어요!';
  final TextStyle _textStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                BackAppBar(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Resource.icon('ic_exclamation_mark', width: 24, height: 24),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      _text,
                      style: _textStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 52,
                )
              ],
            ),
          ),
        ));
  }
}
