import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';

class RewardMainItem extends StatelessWidget {
  final int week;
  final bool loading;
  final StepItemModel? data;
  final int currentWeek;
  final Function(StepItemModel)? gaFunction;
  final bool isFinal;

  RewardMainItem(
      {super.key,
      required this.week,
      required this.loading,
      required this.data,
      required this.currentWeek,
      this.gaFunction,
      this.isFinal = false});

  final TextStyle _nameStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.black);

  final TextStyle _weekStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.white);
  final TextStyle _dateStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.white);
  final ScreenUtil _screenUtil = ScreenUtil();

  final double _defaultRadius = 126;
  final double _defaultImgContainerSize = 86;
  final double _defaultImgSize = 60;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return _smallSkeleton();
    } else {
      return _bigContainer(data);
    }
  }

  Widget _smallSkeleton() => SizedBox(
        width: _defaultRadius,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DPSkeletonContainer(width: _defaultRadius, height: 18),
            const SizedBox(
              height: 12,
            ),
            DPSkeletonContainer(
              width: _defaultRadius,
              height: _defaultRadius,
              borderRadius: _screenUtil.radius20,
            ),
          ],
        ),
      );

  Widget _bigContainer(StepItemModel? data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(data),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            if (gaFunction != null) {
              gaFunction?.call(data ?? StepItemModel());
            }
            if(data != null){
              List<RewardModel> rewardList = List.from(data.rewardList);
              if(data.imagePath.isNotEmpty && data.value.isNotEmpty && data.value.isNotEmpty){
                rewardList.add(RewardModel(
                  week: data.week,
                  imagePath: data.imagePath,
                  value: data.value,
                  item: data.value,
                  why: '$week주차 보상',
                  date: data.date,
                ));
              }
              if(rewardList.isNotEmpty){
                showWeekReward(rewardList, week);
              }
            }
          },
          child: _container(data),
        )
      ],
    );
  }

  Widget _container(StepItemModel? data) {
    return Container(
      width: _defaultRadius,
      height: _defaultRadius,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20,
          color: DColors.white.withValues(alpha: 0.1)),
      child: SizedBox(
        width: _defaultRadius,
        height: _defaultRadius,
        child: _check()
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
  bool _check(){
    if(currentWeek == 8 && isFinal){
      return week > currentWeek;
    }else{
      return week >= currentWeek;
    }
  }

  Widget _emptyContainer() {
    return Resource.icon('ic_question_mark',
        width: _defaultImgSize, height: _defaultImgSize);
  }

  Widget _imgContainer(String imgPath) {
    Widget imgWidget = DPNetworkImage(
      imgPath: imgPath,
      width: _defaultImgSize,
      height: _defaultImgSize,
    );
    if (imgPath == '') {
      imgWidget = Container();
    }
    return Container(
      width: _defaultImgContainerSize,
      height: _defaultImgContainerSize,
      decoration: BoxDecoration(
          border: Border.all(color: DColors.white.withValues(alpha: 0.5)),
          color: DColors.grayColor.withValues(alpha: 0.3),
          shape: BoxShape.circle),
      child: Center(
        child: SizedBox(
          width: _defaultImgSize,
          height: _defaultImgSize,
          child: imgWidget,
        ),
      ),
    );
  }

  Widget _valueContainer(StepItemModel? data) {
    if (data == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: _defaultRadius,
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
            data.value == '' || data.value == null
                ? 'rewardMain_emptyReward'.tr
                : data.value,
            style: _nameStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  void showWeekReward(List<RewardModel> dataList, int week) {
    DPBottomSheet.showBDefaultBottomSheet(
        RewardWeekBottomSheet(
          week: week,
          dataList: dataList,
          isDepRx: gaFunction != null,
        ),
        backgroundColor: DColors.white,
        enableDrag: false,
        isScrollControlled: false,
        barrierColor: DColors.black.withValues(alpha: 0.7));
  }

  Widget _header(StepItemModel? data) {
    String weekText = '$week${'common_week'.tr}';
    if (week == 9) {
      weekText = 'common_finalReward'.tr;
    }
    return SizedBox(
      width: _defaultRadius,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            weekText,
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
