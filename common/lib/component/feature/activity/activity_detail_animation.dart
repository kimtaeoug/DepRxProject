import 'package:flutter/cupertino.dart';
import 'package:resource/screen_util.dart';

class ActivityDetailAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> padding;
  final Widget widget;
  final ScreenUtil screenUtil;

  ActivityDetailAnimation(
      {super.key,
      required this.controller,
      required this.screenUtil,
      required this.widget})
      : padding = Tween<double>(
                begin: (screenUtil.height - 240) / 2,
                end: 113 * screenUtil.width / 390)
            .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(top: padding.value),
            child: widget,
          );
        });
  }
}
