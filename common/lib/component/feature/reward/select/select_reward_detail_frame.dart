import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
import '../../../common/dp_network_img.dart';
import '../../../common/dp_title.dart';

class SelectRewardDetailFrame extends StatefulWidget {
  final Function() moveFunction;
  final int selectedWeek;
  final List<RewardModel> selectedRewardList;
  final Function(RewardModel) selectRewardValueFunction;

  SelectRewardDetailFrame({super.key, required this.moveFunction,
    required this.selectedWeek,
    required this.selectedRewardList,
    required this.selectRewardValueFunction

  });

  @override
  State<StatefulWidget> createState() => _SelectRewardDetailFrame();
}

class _SelectRewardDetailFrame extends State<SelectRewardDetailFrame> {
  // final RewardController _controller = Get.find();

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          DpTitle(title: '${widget.selectedWeek}${'rewardSelectDetail_overview_title'.tr}'),
          const SizedBox(
            height: 20,
          ),
          widget.selectedRewardList.isNotEmpty ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(widget.selectedRewardList.length, (idx) {
              RewardModel data = widget.selectedRewardList[idx];
              return Padding(
                padding: EdgeInsets.only(
                    bottom: idx != widget.selectedRewardList.length - 1 ? 20 : 0),
                child: _item(data),
              );
            }),
          ) : const SizedBox.shrink()
        ],
      ),
    );
  }

  final TextStyle _textStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);

  Widget _item(RewardModel data, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          widget.selectRewardValueFunction(data);
          // _controller.selectedRewardValue.value = data;
          widget.moveFunction();
        },
        child: Container(
          width: _screenUtil.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color:
                      isSelected ? DColors.primaryNormalColor : DColors.white,
                  width: 1.5),
              color: isSelected ? DColors.bgBlueColor : DColors.white,
              boxShadow: isSelected
                  ? _screenUtil.emphasizeShadow()
                  : _screenUtil.pressShadow()),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: DPNetworkImage(
                    imgPath: data.imagePath, width: 70, height: 70),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.value,
                style: _textStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
