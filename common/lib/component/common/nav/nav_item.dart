import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

import 'package:core/core.dart';

class NavItem extends StatelessWidget {
  final NavType type;
  final bool isActivate;
  final bool isSham;

  NavItem({super.key, required this.type, this.isActivate = false, this.isSham = false});
  final ScreenUtil _screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _screenUtil.duration100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _screenUtil.svgIcon(NavTypeStyle.imgPath(type, isActivate: isActivate)),
          const SizedBox(
            height: 4,
          ),
          Text(
            isSham ? type.shamTitle : type.title,
            style: NavTypeStyle.textStyle(type, isActivate: isActivate),
          )
        ],
      ),
    );
  }
}
