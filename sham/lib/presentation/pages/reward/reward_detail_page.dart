import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';

class RewardDetailPage extends StatefulWidget{
  final RewardModel? data = Get.arguments?['data'] as RewardModel?;

  @override
  State<StatefulWidget> createState() => _RewardDetailPage();

}

class _RewardDetailPage extends State<RewardDetailPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState(){
    GAUtil.logScreen(screenName: GAScreenList.rewardDetail, isDeprx: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackAppBar(),
                    RewardDetailCard(data: widget.data)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 56),
                  child: DPbutton(
                      text: 'common_ctaBtn_confirm'.tr,
                      function: () {
                        GAUtil.trackEvent(
                            name: GAEventList.REWARD_DETAIL_CONFIRM_BUTTON_CLICK,
                            params: {
                              GAParameter.REWARD_NAME: widget.data?.value ?? '',
                              GAParameter.RECEIVED_DATE:
                              widget.data?.date ?? '',
                              GAParameter.WEEK: widget.data?.week ?? ''
                            }, isDeprx: false);
                        Get.back();
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
