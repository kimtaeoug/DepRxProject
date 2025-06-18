import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
import '../../../common/animation/dp_skeleton_container.dart';
import '../../../common/dp_network_img.dart';

class RewardFinalMainItem extends StatelessWidget {
  final bool stepLoading;
  final StepItemModel? data;

  RewardFinalMainItem(
      {super.key, required this.stepLoading, required this.data});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    if (stepLoading) {
      return _bigSkeleton();
    } else {
      return _finalBigContainer(data);
    }
  }

  final double _finalRadius = 166;
  final double _finalImgContainerSize = 126;
  final double _finalImgSize = 100;

  Widget _bigSkeleton() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius20,
            color: DColors.white.withValues(alpha: 0.8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DPSkeletonContainer(width: _finalRadius, height: 23),
            const SizedBox(
              height: 12,
            ),
            DPSkeletonContainer(
              width: _finalRadius,
              height: _finalRadius,
              borderRadius: _screenUtil.radius20,
            ),
          ],
        ),
      );

  Widget _finalBigContainer(StepItemModel? data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
          color: DColors.white.withValues(alpha: 0.08),
          borderRadius: _screenUtil.radius20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(data),
          const SizedBox(
            height: 12,
          ),
          _finalContainer(data)
        ],
      ),
    );
  }

  Widget _emptyContainer() {
    return Resource.icon('ic_question_mark',
        width: _finalImgSize, height: _finalImgSize);
  }

  Widget _finalContainer(StepItemModel? data) {
    return Container(
      width: _finalRadius,
      height: _finalRadius,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20,
          color: DColors.white.withValues(alpha: 0.1)),
      child: SizedBox(
        width: _finalRadius,
        height: _finalRadius,
        child: data?.imagePath == null || data?.imagePath == ''
            ? _emptyContainer()
            : Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _imgContainer(data?.imagePath ?? '')),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _valueContainer(data))
          ],
        ),
      ),
    );
  }

  Widget _imgContainer(String imgPath) {
    return Container(
      width: _finalImgContainerSize,
      height: _finalImgContainerSize,
      decoration: BoxDecoration(
          border: Border.all(color: DColors.white.withValues(alpha: 0.5)),
          color: DColors.grayColor.withValues(alpha: 0.3),
          shape: BoxShape.circle),
      child: Center(
        child: SizedBox(
          width: _finalImgSize,
          height: _finalImgSize,
          child: DPNetworkImage(
            imgPath: imgPath,
            width: _finalImgSize,
            height: _finalImgSize,
          ),
        ),
      ),
    );
  }

  final TextStyle _nameStyle =
  DpTextStyle.detail1.style.copyWith(color: DColors.black);

  Widget _valueContainer(StepItemModel? data) {
    if (data == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: _finalRadius,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: DColors.black.withValues(alpha: 0.2),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                )
              ],
              color: DColors.bgBlueColor,
              border: Border.all(color: DColors.white),
              borderRadius: _screenUtil.radius8),
          child: Text(
            data.value,
            style: _nameStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  final TextStyle _weekStyle =
  DpTextStyle.b3.style.copyWith(color: DColors.white);
  final TextStyle _dateStyle =
  DpTextStyle.detail2.style.copyWith(color: DColors.white);

  Widget _header(StepItemModel? data) {
    return SizedBox(
      width: _finalRadius,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'common_finalReward'.tr,
            style: _weekStyle,
          ),
          if (data != null)
            Text(
              data.date,
              style: _dateStyle,
            )
        ],
      ),
    );
  }
}
