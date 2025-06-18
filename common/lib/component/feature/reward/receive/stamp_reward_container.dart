import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:api/api.dart';
import 'package:resource/resource_manager.dart';
import '../../../common/dp_indicator.dart';
import 'stamp_reward_container_item.dart';

class StampRewardContainer extends StatefulWidget {
  final List<RewardModel> dataList;
  final Function()? moveFunction;

  StampRewardContainer({super.key, required this.dataList, this.moveFunction});

  @override
  State<StatefulWidget> createState() => _StampRewardContainer();
}

class _StampRewardContainer extends State<StampRewardContainer> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();

  List<Widget> widgetList({bool isLast = false}) => widget.dataList.map((e) {
        return StampRewardContainerItem(
            data: e,
            moveFunction: () {
              _move();
            },
            isLast: isLast);
      }).toList();

  int currentIdx = 0;

  void _move() {
    if (widget.dataList.length <= 1) {
      if (widget.moveFunction != null) {
        widget.moveFunction!();
      } else {
        Get.back();
      }
    } else {
      if (currentIdx == widget.dataList.length - 1) {
        if (widget.moveFunction != null) {
          widget.moveFunction!();
        }
      } else {
        setState(() {
          currentIdx += 1;
        });
        _pageController.animateToPage(currentIdx,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Stack(
        children: [
          Resource.image('reward_bg',
              width: _screenUtil.width, height: _screenUtil.height),
          SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: PageView.builder(
                controller: _pageController,
                // pageSnapping: false,
                padEnds: false,
                itemCount: widgetList().length,
                // physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (idx) {
                  setState(() {
                    currentIdx = idx;
                  });
                },
                itemBuilder: (_, idx) {
                  return widgetList(
                      isLast: idx == widgetList().length - 1)[idx];
                }),
          ),
          if (widget.dataList.length > 1)
            Positioned(
                top: _screenUtil.topPadding + 26,
                right: 33,
                child: DPIndicator(
                    currentIdx: currentIdx,
                    totalLength: widget.dataList.length))
        ],
      ),
    );
  }
}
