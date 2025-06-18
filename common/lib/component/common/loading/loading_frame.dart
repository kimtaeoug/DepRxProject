import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class LoadingFrame extends StatelessWidget {
  final Color? backColor;

  LoadingFrame({super.key, this.backColor});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: _screenUtil.width,
        height: _screenUtil.height,
        color: backColor ?? DColors.bgLightGray,
        child: Center(
          child: Resource.lottiAnimation('loading',
              boxFit: BoxFit.fitWidth, width: 120),
        ),
      ),
    );
  }
}
