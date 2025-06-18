import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
import 'package:sham/presentation/controllers/reward/reward_controller.dart';

class RewardSelectPage extends StatefulWidget {
  bool? nowRSI = Get.arguments?['rsi'] as bool?;

  RewardSelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _RewardSelectPage();
}

class _RewardSelectPage extends State<RewardSelectPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  final RewardController _rewardController = Get.find();
  late final List<Widget> _frameList = [
    SelectRewardTypeFrame(
      data: const RewardSelectModel(),
      moveFunction: (value) {
        _moveFunction(isForward: true);
      },
    ),
    Obx(() {
      return SelectRewardDetailFrame(
        moveFunction: () {
          _moveFunction(isForward: true);
        },
        selectedWeek: _rewardController.selectedWeek.value,
        selectedRewardList: _rewardController.selectedRewardList.value,
        selectRewardValueFunction: (model) {
          _rewardController.selectedRewardValue.value = model;
        },
      );
    })
  ];

  int currentIdx = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rewardSelect, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _rewardController.getSelectRewardList(
          successFunction: (data) {
            setState(() {
              _frameList[0] = SelectRewardTypeFrame(
                data: data,
                moveFunction: (value) {
                  Future.delayed(_screenUtil.duration300).whenComplete(() {
                    _moveFunction(isForward: true);
                  });
                },
                dateFunction: () {
                  _rewardController.selectedWeek.value = data.week;
                },
                baFunction: () {
                  _rewardController.selectedRewardList.value = data.activity;
                  _rewardController.selectedRewardList.refresh();
                  _rewardController.type.value = 'BA';
                  GAUtil.trackEvent(name: GAEventList.REWARD_OPTION_CLICK, params: {
                    GAParameter.OPTION_TYPE: "행동",
                    GAParameter.WEEK: '${_rewardController.week}주'
                  }, isDeprx: false);
                },
                emotionFunction: () {
                  _rewardController.selectedRewardList.value = data.emotion;
                  _rewardController.selectedRewardList.refresh();
                  _rewardController.type.value = 'EMOTION';
                  GAUtil.trackEvent(name: GAEventList.REWARD_OPTION_CLICK, params: {
                    GAParameter.OPTION_TYPE: "감정",
                    GAParameter.WEEK: '${_rewardController.week}주'
                  }, isDeprx: false);
                },
              );
            });
          },
          isRsi: widget.nowRSI ?? false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Obx(() {
              RxBool loading = _rewardController.selectedLoading;
              RxBool selectRLoading = _rewardController.selectRewardLoading;
              return loading.value
                  ? LoadingFrame()
                  : Stack(
                      children: [
                        SizedBox(
                          width: _screenUtil.width,
                          height: _screenUtil.height,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 72,
                              ),
                              Expanded(
                                  child: PageView.builder(
                                      controller: _pageController,
                                      padEnds: false,
                                      pageSnapping: false,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: _frameList.length,
                                      onPageChanged: (idx) {
                                        setState(() {
                                          currentIdx = idx;
                                        });
                                      },
                                      itemBuilder: (context, idx) {
                                        return _frameList[idx];
                                      }))
                            ],
                          ),
                        ),
                        if (selectRLoading.value) SmallLoadingFrame()
                      ],
                    );
            }),
          ),
        ));
  }

  void _moveFunction({bool isForward = true}) {
    if (isForward) {
      if (currentIdx == 1) {
        _rewardController.selectReward(isRsi: widget.nowRSI ?? false);
      } else {
        setState(() {
          currentIdx += 1;
        });
        _pageController.animateToPage(currentIdx,
            duration: _screenUtil.duration300, curve: Curves.linear);
      }
    } else {
      if (currentIdx == 0) {
        Get.back();
      } else {
        setState(() {
          currentIdx -= 1;
        });
        _pageController.animateToPage(currentIdx,
            duration: _screenUtil.duration300, curve: Curves.linear);
      }
    }
  }
}
