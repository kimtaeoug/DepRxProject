import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import '../../controllers/reward/reward_controller.dart';

class RewardStoragePage extends StatefulWidget {
  const RewardStoragePage({super.key});

  @override
  State<StatefulWidget> createState() => _RewardStoragePage();
}

class _RewardStoragePage extends State<RewardStoragePage> {
  final RewardController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  int currentIdx = 0;

  late final List<Widget> _containerList = List.generate(4, (idx) {
    switch (idx) {
      case 0:
        return Obx(() {
          if (_controller.totalEmpty.value) {
            return RewardEmpty();
          } else {
            GAUtil.trackEvent(name: GAEventList.REWARD_STORAGE_VIEW);
            return RewardStorageContainer(
              data: _controller.totalReward.value,
              type: '전체',
            );
          }
        });
      case 1:
        return Obx(() {
          if (_controller.stampEmpty.value) {
            return RewardEmpty();
          } else {
            GAUtil.trackEvent(
                name: GAEventList.REWARD_STORAGE_VIEW,
                params: {GAParameter.VIEW_TYPE: '스탬프'});
            return RewardStorageContainer(
              data: _controller.stampReward.value,
              type: '스탬프',
            );
          }
        });
      case 2:
        return Obx(() {
          if (_controller.emotionEmpty.value) {
            return RewardEmpty();
          } else {
            return RewardStorageContainer(
              data: _controller.emotionReward.value,
              type: '감정',
            );
          }
        });
      case 3:
        return Obx(() {
          if (_controller.activityEmpty.value) {
            return RewardEmpty();
          } else {
            return RewardStorageContainer(
              data: _controller.activityReward.value,
              type: '행동',
            );
          }
        });
      default:
        return RewardStorageContainer(data: {});
    }
  });

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rewardStorage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleAppBar(
                  title: 'rewardStorage_appBar_title'.tr,
                  isDeprx: true,
                ),
                RewardTabBar(
                    currentIdx: currentIdx,
                    function: (idx) {
                      _move(idx);
                      setState(() {
                        currentIdx = idx;
                      });
                    }),
                Expanded(
                  child: DpPageView(
                      controller: _pageController,
                      length: _containerList.length,
                      onPageChanged: (idx) {
                        GAUtil.trackEvent(
                            name: GAEventList.REWARD_STORAGE_TAB_SWITCH,
                            params: {
                              GAParameter.PREVIOUS_TAB:
                                  GAConverterUtil.getRewardStorageTAB(
                                      currentIdx),
                              GAParameter.NEW_TAB:
                                  GAConverterUtil.getRewardStorageTAB(idx)
                            });
                        setState(() {
                          currentIdx = idx;
                        });
                      },
                      itemBuilder: (context, idx) {
                        return _containerList[idx];
                      }),
                )
              ],
            ),
          ),
        ));
  }

  void _move(int idx) {
    int difference = (currentIdx - idx).abs();
    if (difference == 1) {
      _pageController.animateToPage(idx,
          duration: _screenUtil.duration300, curve: Curves.linear);
    } else {
      if (difference != 0) {
        if (idx != 0) {
          _pageController.jumpToPage(idx - 1);
          _pageController.animateToPage(idx,
              duration: _screenUtil.duration300, curve: Curves.linear);
        } else {
          _pageController.jumpToPage(1);
          _pageController.animateToPage(0,
              duration: _screenUtil.duration300, curve: Curves.linear);
        }
      }
    }
  }
}
