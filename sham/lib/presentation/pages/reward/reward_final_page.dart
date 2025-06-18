import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../controllers/reward/reward_controller.dart';
class RewardFinalPage extends StatefulWidget {
  final FinalRewardModel? data = Get.arguments?['data'] as FinalRewardModel?;

  RewardFinalPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RewardFinalPage();
}

class _RewardFinalPage extends State<RewardFinalPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final RewardController _controller = Get.find();
  late final ValueNotifier<FinalRewardModel?> finalReward =
      ValueNotifier(widget.data);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rewardFinal, isDeprx: false);
    if(widget.data?.why != null || widget.data?.why != ''){
      GAUtil.trackEvent(name: GAEventList.FINAL_REWARD_FAILURE_SCREEN_VIEW, params: {
        GAParameter.FAILURE_REASON : widget.data?.why ?? '',
        GAParameter.RECEIVED_DATE : widget.data?.date ?? ''
      }, isDeprx: false);
    }else{
      GAUtil.trackEvent(name: GAEventList.FINAL_REWARD_SCREEN_VIEW, params: {
        GAParameter.REWARD_NAME: widget.data?.contents ?? '',
        GAParameter.RECEIVED_DATE: widget.data?.date ?? '',
      }, isDeprx: false);
    }
    if (Get.previousRoute == Routes.splash) {
      SplashUtil.preWord();
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.data == null) {
        _controller.getRewardFinal(successFunction: (data) {
          setState(() {
            finalReward.value = data;
          });
        });
      }
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
          backgroundColor: DColors.white,
          body: ValueListenableBuilder(
              valueListenable: finalReward,
              builder: (context, value, child) {
                if (value == null || value == const FinalRewardModel()) {
                  return LoadingFrame();
                } else {
                  return SizedBox(
                    width: _screenUtil.width,
                    height: _screenUtil.height,
                    child: Padding(
                      padding: EdgeInsets.only(top: _screenUtil.topPadding),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            RewardFinalCard(
                                imgPath: value.imagePath,
                                header: value.header,
                                content: value.contents,
                                date: value.date,
                                inCompleteReason: value.why),
                            const SizedBox(
                              height: 30,
                            ),
                            RewardUsedWrap(value: value),
                            const SizedBox(
                              height: 56,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 51),
                              child: DPbutton(
                                  text: 'common_ctaBtn_confirm'.tr,
                                  function: () {
                                    _controller.initStep(isFinal: true);
                                    _controller.initTotalReward(isFinal: true);
                                    _controller.service.move();
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ));
  }
}
