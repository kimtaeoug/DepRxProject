import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import '../../common/animation/dp_skeleton.dart';
import '../../common/animation/dp_skeleton_container.dart';

class AttendanceSkeleton extends StatelessWidget {
  AttendanceSkeleton({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: DColors.bgLightGray),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: DpSkeleton.fromColors(
                baseColor: DColors.skeletonBaseColor,
                highlightColor: DColors.skeletonHighLightColor,
                child: Container(
                  width: _screenUtil.width,
                  height: 26,
                  color: DColors.white,
                )),
          ),
          const SizedBox(
            height: 17,
          ),
          DPSkeletonContainer(
            width: _screenUtil.width,
            height: 40,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          const SizedBox(
            height: 15,
          ),
          _container(),
          const SizedBox(
            height: 12,
          ),
          _container(),
          const SizedBox(
            height: 12,
          ),
          DPSkeletonContainer(
            width: _screenUtil.width,
            height: 25,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ],
      ),
    );
  }

  Widget _container() => DPSkeletonContainer(
        width: _screenUtil.width,
        height: 74,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
}
