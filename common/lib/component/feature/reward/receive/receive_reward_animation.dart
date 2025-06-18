import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class ReceiveRewardAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> opacity1;
  final Animation<double> opacity2;
  final Widget widget1;
  final Widget widget2;

  ReceiveRewardAnimation(
      {Key? key,
      required this.controller,
      required this.widget1,
      required this.widget2})
      : opacity1 = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.5, curve: Curves.linear))),
        opacity2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.99, curve: Curves.linear))),
        super(key: key);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            return Stack(
              children: [
                Opacity(
                  opacity: opacity1.value,
                  child: widget1,
                ),
                Opacity(
                  opacity: opacity2.value,
                  child: widget2,
                )
              ],
            );
          }),
    );
  }
}
