import 'package:api/data/model/reward/reward_model.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/reward/reward_controller.dart';

class ReceiveWeekRewardPage extends StatefulWidget {
  const ReceiveWeekRewardPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReceiveWeekRewardPage();
}

class _ReceiveWeekRewardPage extends State<ReceiveWeekRewardPage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  final RewardController _controller = Get.find();
  final Duration _animationDuration = const Duration(milliseconds: 400);
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: _animationDuration);
  late final AnimationController _rewardAnimationController =
      AnimationController(vsync: this);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.receiveWeekReward, isDeprx: false);
    super.initState();
    _rewardAnimationController.addStatusListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getReceiveWeekReward();
    });
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
        child: Obx(() {
          RxBool receiveWeekLoading = _controller.receiveWeekLoading;
          if (receiveWeekLoading.value ||
              _controller.rewardEmpty(_controller.receiveWeekReward.value)) {
            return LoadingFrame();
          } else {
            Rx<RewardModel> reward = _controller.receiveWeekReward;
            if (reward.value.value != '' && reward.value.label != '') {
              return Scaffold(
                backgroundColor: DColors.white,
                body: SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: ReceiveRewardAnimation(
                      controller: _animationController,
                      widget1: RewardAnimationContainer(
                        animationController: _rewardAnimationController,
                        data: reward.value,
                      ),
                      widget2: WeekRewardContainer(
                        data: reward.value,
                        week: reward.value.week,
                        moveFunction: () {
                          _controller.service.move();
                        },
                      )),
                ),
              );
            } else {
              GAUtil.trackEvent(
                  name: GAEventList.REWARD_MISSED_SCREEN_VIEW,
                  params: {GAParameter.MISSED_WEEK: reward.value.week}, isDeprx: false);
              return Scaffold(
                backgroundColor: DColors.white,
                body: SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: _screenUtil.topPadding + 50),
                        child: NoRewardCard(
                            imgPath: reward.value.imagePath,
                            why: reward.value.why),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 51),
                        child: DPbutton(
                            text: 'common_ctaBtn_confirm'.tr,
                            function: () {
                              _controller.service.move();
                            },
                            boxShadow: _screenUtil.heavyShadow()),
                      )
                    ],
                  ),
                ),
              );
            }
          }
        }));
  }
}
