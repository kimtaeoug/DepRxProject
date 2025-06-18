import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import '../../common/animation/dp_skeleton_container.dart';

class MyPageRewardSkeleton extends StatelessWidget {
  MyPageRewardSkeleton({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: DColors.bgLightGray),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _container(_screenUtil.width, 24),
          const SizedBox(
            height: 21,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 16,
            children: List.generate(
                6,
                (idx) => _container((_screenUtil.width - 92) / 3,
                    (_screenUtil.width - 92) / 3)),
          )
        ],
      ),
    );
  }

  Widget _container(double width, double height) => DPSkeletonContainer(
        width: width,
        height: height,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
}
