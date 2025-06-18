
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
import 'dp_skeleton.dart';

class DPImgSkeleton extends StatelessWidget {
  final double width;
  final double? height;
  final BorderRadius? borderRadius;

  const DPImgSkeleton({
    Key? key,
    required this.width,
     this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: _skeleton(),
      ),
    );
  }

  Widget _skeleton() => DpSkeleton.fromColors(
      baseColor: DColors.skeletonBaseColor,
      highlightColor: DColors.skeletonHighLightColor,
      child: Container(
        width: width,
        height: height,
        color: DColors.white,
      ));
}
