import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:common/common.dart';
import '../../controllers/reward/reward_controller.dart';

class RewardMainPage extends StatefulWidget {
  const RewardMainPage({super.key});

  @override
  State<StatefulWidget> createState() => _RewardMainPage();
}

class _RewardMainPage extends State<RewardMainPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final RewardController _controller = Get.find();
  final TextStyle _btnStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.white);

  final List<StepItemModel> _stepList =
      List.generate(8, (idx) => StepItemModel(week: idx + 1));

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.rewardMain, isDeprx: false);
    _controller.initStep();
    _controller.initTotalReward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, child) {
          if (!value) {
            Get.back();
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: Container(
            width: _screenUtil.width,
            height: _screenUtil.height,
            decoration:
                const BoxDecoration(gradient: DColors.rewardMainGradient),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
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
                              TitleAppBar(
                                title: 'rewardMain_appBar_title'.tr,
                                backFunction: () {
                                  Get.back();
                                },
                                needTopPadding: false,
                                isWhite: true,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: SizedBox(
                                      width: _screenUtil.width,
                                      child: Obx(() {
                                        RxBool loading =
                                            _controller.stepLoading;
                                        RxMap dataMap = _controller.stepMap;
                                        return Wrap(
                                          alignment: WrapAlignment.spaceBetween,
                                          runAlignment:
                                              WrapAlignment.spaceBetween,
                                          children: _stepList
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 26),
                                                    child: RewardMainItem(
                                                      week: e.week,
                                                      loading: loading.value,
                                                      data: dataMap[e.week],
                                                      currentWeek:
                                                          _controller.week,
                                                      isFinal: dataMap[9] != null,
                                                      gaFunction: (data) {
                                                        GAUtil.trackEvent(
                                                            name: GAEventList
                                                                .REWARD_MAIN_ITEM_CLICK,
                                                            params: {
                                                              GAParameter.WEEK:
                                                              e.week,
                                                              GAParameter
                                                                  .REWARD_NAME:
                                                              data.value
                                                            }, isDeprx: false);
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      }),
                                    ),
                                  ),
                                  Obx(() {
                                    RxBool loading = _controller.stepLoading;
                                    RxMap dataMap = _controller.stepMap;
                                    return RewardFinalMainItem(
                                      stepLoading: loading.value,
                                      data: dataMap[9],
                                    );
                                  })
                                ],
                              ),
                              const SizedBox(
                                height: 153,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 44,
                    child: DPbutton(
                      text: '',
                      function: () {
                        GAUtil.trackEvent(
                            name: GAEventList.MYREWARD_STORAGE_OPEN_CLICK, isDeprx: false);
                        Get.toNamed(Routes.rewardStoragePage);
                      },
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'rewardMain_ctaBtn'.tr,
                            style: _btnStyle,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Resource.icon('ic_arrow_right_small_blue',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                  DColors.white, BlendMode.srcIn)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
