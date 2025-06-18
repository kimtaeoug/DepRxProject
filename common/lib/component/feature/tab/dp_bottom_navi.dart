import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../common/nav/nav_item.dart';

class BottomNavi extends StatelessWidget {
  final int currentIdx;
  final Function(NavType) function;
  final bool isSham;

  BottomNavi({super.key, required this.currentIdx, required this.function, this.isSham = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final List<NavType> navList = NavType.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.only(left: 8,right: 8, top: 0, bottom: 21),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20,
          color: DColors.white,
          boxShadow: [
            BoxShadow(
                color: DColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -6))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(navList.length, (idx) {
          NavType data = navList[idx];
          return GestureDetector(
            onTap: () {
              function.call(data);
            },
            child: Container(
              width: (_screenUtil.width - 16)/5,
              padding: const EdgeInsets.only(bottom: 3, top: 17),
              color: DColors.transparent,
              child: Center(
                child: NavItem(
                  type: data,
                  isActivate: idx == currentIdx,
                  isSham : isSham
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
