import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

import 'package:api/api.dart';
import '../../../common/dp_network_img.dart';
import '../../../common/dp_title.dart';

class SelectRewardTypeFrame extends StatefulWidget {
  final RewardSelectModel data;
  final Function(bool) moveFunction;
  final Function()? dateFunction;
  final Function()? baFunction;
  final Function()? emotionFunction;

  const SelectRewardTypeFrame(
      {super.key,
      required this.data,
      required this.moveFunction,
        this.dateFunction,
       this.baFunction,
       this.emotionFunction});

  @override
  State<StatefulWidget> createState() => _SelectRewardTypeFrame();
}

class _SelectRewardTypeFrame extends State<SelectRewardTypeFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();

  int selectIdx = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DpTitle(
              title: 'rewardSelect_overview_title'.tr,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            _selectItem(0, isActivity: false),
            const SizedBox(
              height: 30,
            ),
            _selectItem(1)
          ],
        ),
      ),
    );
  }

  final TextStyle _defaultStyle = DpTextStyle.h6.style;

  Widget _selectItem(int idx, {bool isActivity = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectIdx = idx;
          });
          //todo
          widget.dateFunction?.call();
          if(isActivity){
            widget.baFunction?.call();
            widget.moveFunction(true);
          }else{
            widget.emotionFunction?.call();
            widget.moveFunction(false);
          }
          // _controller.selectedWeek.value = widget.data.week;
          // if (isActivity) {
          //   _controller.selectedRewardList.value = widget.data.activity;
          //   _controller.selectedRewardList.refresh();
          //   _controller.type.value = 'BA';
          //   widget.moveFunction(true);
          // } else {
          //   _controller.selectedRewardList.value = widget.data.emotion;
          //   _controller.selectedRewardList.refresh();
          //   _controller.type.value = 'EMOTION';
          //   widget.moveFunction(false);
          // }
        },
        child: Container(
          width: _screenUtil.width,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: idx == selectIdx
                      ? DColors.primaryNormalColor
                      : DColors.white,
                  width: 1.5),
              color: idx == selectIdx ? DColors.bgBlueColor : DColors.white,
              boxShadow: idx == selectIdx
                  ? _screenUtil.emphasizeShadow()
                  : _screenUtil.pressShadow()),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: DPNetworkImage(
                      imgPath: isActivity
                          ? widget.data.activityImage
                          : widget.data.emotionImage,
                      width: 100,
                      height: 100),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '${widget.data.week}${'rewardSelect_itemPrefix'.tr}',
                    style: _defaultStyle.copyWith(color: DColors.black),
                  ),
                  TextSpan(
                      text: isActivity ? 'common_activity'.tr : 'common_emotion'.tr,
                      style: _defaultStyle.copyWith(
                          color: DColors.primaryNormalColor)),
                  TextSpan(
                      text: 'rewardSelect_itemSubfix'.tr,
                      style: _defaultStyle.copyWith(color: DColors.black))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
