import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'dp_skeleton.dart';

class DPSkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const DPSkeletonContainer(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: DpSkeleton.fromColors(
          baseColor: DColors.skeletonBaseColor,
          highlightColor: DColors.skeletonHighLightColor,
          child: Container(
            width: width,
            height: height,
            color: DColors.white,
          )),
    );
  }
}
