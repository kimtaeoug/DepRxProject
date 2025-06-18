import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';

class ReceiveStampRewardPage extends StatefulWidget {
  final List<RewardModel>? data =
      Get.arguments?['data'] as List<RewardModel>?;
  final Function()? moveFunction = Get.arguments?['function'] as Function()?;

  ReceiveStampRewardPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReceiveStampRewardPage();
}

class _ReceiveStampRewardPage extends State<ReceiveStampRewardPage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Duration _animationDuration = const Duration(milliseconds: 400);
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: _animationDuration);
  late final AnimationController _rewardAnimationController =
      AnimationController(vsync: this);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.receiveStampReward, isDeprx: false);
    super.initState();
    _rewardAnimationController.addStatusListener(_listener);
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _rewardAnimationController.removeStatusListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child:  Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: ReceiveRewardAnimation(
                controller: _animationController,
                widget1: RewardAnimationContainer(
                  animationController: _rewardAnimationController,
                ),
                widget2: StampRewardContainer(
                  dataList: widget.data ?? [],
                  moveFunction: widget.moveFunction,
                )),
          ),
        ));
  }
}
