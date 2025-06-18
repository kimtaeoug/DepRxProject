import 'package:flutter/cupertino.dart';

import '../animation/dp_skeleton_container.dart';
import 'package:resource/resource_manager.dart';

class RankingSkeleton extends StatelessWidget {
  RankingSkeleton({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  final double height = 390;
  late final double _itemWidth = _screenUtil.width - 80;
  late final double _itemHeight = 78;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: height,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Stack(
        children: [
          DPSkeletonContainer(
            width: _screenUtil.width,
            height: height,
            borderRadius: _screenUtil.radius20,
          ),
          SizedBox(
            width: _screenUtil.width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DPSkeletonContainer(
                    width: 85,
                    height: 50,
                    borderRadius: _screenUtil.radius20,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (idx) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: idx != 2 ? 16 : 0),
                        child: DPSkeletonContainer(
                          width: _itemWidth,
                          height: _itemHeight,
                          borderRadius: _screenUtil.radius20,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
