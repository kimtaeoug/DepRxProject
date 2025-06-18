import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class MyPageItemContainer extends StatelessWidget {
  final List<Widget> widgetList;
  final Color? containerColor;
  final Color? dividerColor;

  MyPageItemContainer(
      {super.key,
      required this.widgetList,
      this.containerColor,
      this.dividerColor});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: containerColor ?? DColors.bgLightGray),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widgetList.length, (idx) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widgetList[idx],
              if (idx != widgetList.length - 1)
                Container(
                  width: _screenUtil.width,
                  height: 1,
                  color: dividerColor ?? DColors.lineAlternativeColor,
                )
            ],
          );
        }),
      ),
    );
  }
}
