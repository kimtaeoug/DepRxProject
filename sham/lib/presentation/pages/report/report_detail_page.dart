import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../controllers/report/report_controller.dart';

class ReportDetailPage extends StatefulWidget {
  final int? week = Get.arguments?['week'] as int?;

  ReportDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReportDetailPage();
}

class _ReportDetailPage extends State<ReportDetailPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PrefUtil spUtil = PrefUtil();
  final TextStyle _headTitleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);
  final ReportController _controller = Get.find();
  late bool isFromTab = Get.previousRoute == Routes.homePage;
  late int week = widget.week ?? _controller.apiWeek;
  final KbadsUtil kbadsUtil = KbadsUtil();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.reportDetail, params: {
      GAParameter.WEEK : widget.week ?? 1
    }, isDeprx: false);
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      kbadsUtil.initData(_controller.jsonService);
      _controller.getWeekReport(week);
    });
  }

  void _scrollListener() {
    double max = _scrollController.position.maxScrollExtent;
    if (_scrollController.hasClients) {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        double value = _scrollController.offset / max;
        if (value == 75) {
          GAUtil.trackEvent(
              name: GAEventList.WEEKLY_REPORT_SCROLL,
              params: {GAParameter.SCROLL_DEPTH: '75%'}, isDeprx: false);
        } else if (value == 100) {
          GAUtil.trackEvent(
              name: GAEventList.WEEKLY_REPORT_SCROLL,
              params: {GAParameter.SCROLL_DEPTH: '100%'}, isDeprx: false);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RxBool loading = _controller.loading;
      RxMap<int, ReportModel> dataMap = _controller.reportData;
      if (loading.value || dataMap[week] == null) {
        return LoadingFrame();
      } else {
        ReportModel data = dataMap[week] ?? const ReportModel();
        return PopScope(
            canPop: false,
            onPopInvokedWithResult: (value, _) {
              if (isFromTab) {
                if (!value) {
                  Get.back();
                }
              }
            },
            child: Scaffold(
              backgroundColor: DColors.bgLightGray,
              body: SizedBox(
                width: _screenUtil.width,
                height: _screenUtil.height,
                child: Padding(
                  padding: EdgeInsets.only(top: _screenUtil.topPadding),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (isFromTab)
                          BackAppBar(
                            showBack: isFromTab,
                            needTopPadding: false,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 24, right: 24),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '$week${'reportDetail_overview_title'.tr}',
                              style: _headTitleStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'reportDetail_kbads_overview_title'.tr,
                              style: _titleStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                            valueListenable: kbadsUtil.loading,
                            builder: (context, value, _) {
                              if (value) {
                                return DPSkeletonContainer(
                                    width: _screenUtil.width, height: 400);
                              } else {
                                return _kbadsContainer(data);
                              }
                            }),
                        const SizedBox(
                          height: 48,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: GestureDetector(
                            onTap: () {
                              if (spUtil.rewardOnboarding) {
                                Get.toNamed(Routes.rewardMainPage);
                              } else {
                                Get.toNamed(Routes.rewardOnboardingPage);
                              }
                            },
                            child: Container(
                              width: _screenUtil.width,
                              color: DColors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '$week${'rewardMain_bottomSeet_title'.tr}',
                                    style: _titleStyle,
                                  ),
                                  Resource.icon('ic_arrow_right_small_blue',
                                      width: 24,
                                      height: 24,
                                      colorFilter: const ColorFilter.mode(
                                          DColors.labelNormalColor,
                                          BlendMode.srcIn)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: _screenUtil.width,
                            child: data.rewardList.isEmpty ||
                                    data.rewardList
                                        .where((e) => e != '')
                                        .isEmpty
                                ? ReportEmptyReward()
                                : Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: List.generate(
                                        data.rewardList.length, (idx) {
                                      Log.e(
                                          'data.rewardList[idx] : ${data.rewardList[idx]}');
                                      return SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: DPNetworkImage(
                                          imgPath: data.rewardList[idx],
                                          width: 60,
                                          height: 60,
                                        ),
                                      );
                                    }),
                                  ),
                          ),
                        ),
                        if (isFromTab)
                          const SizedBox(
                            height: 66,
                          ),
                        if (!isFromTab)
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 66),
                            child: DPbutton(
                                text: 'common_ctaBtn_next'.tr,
                                function: () {
                                  _controller.checkReport(week);
                                }),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }
    });
  }

  void show(List<ReportBAItemModel> dataList) {
    DPBottomSheet.showBDefaultBottomSheet(ReportBAList(dataList: dataList),
        isScrollControlled: true);
  }

  ///
  /// k-bads
  ///
  Widget _kbadsContainer(ReportModel input) {
    if (input.kbadsResult.activation.score.where((e) => e != null).isNotEmpty) {
      return SizedBox(
        width: _screenUtil.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ReportKbadsItem(
                type: KBadsType.ac,
                week: week,
                value: input.kbadsResult.activation.score),
            ReportKbadsItem(
                type: KBadsType.aae,
                week: week,
                value: input.kbadsResult.aae.score),
            ReportKbadsItem(
                type: KBadsType.jaal,
                week: week,
                value: input.kbadsResult.jaal.score),
            ReportKbadsItem(
                type: KBadsType.sl,
                week: week,
                value: input.kbadsResult.sl.score),
          ],
        ),
      );
    } else {
      return ReportEmptyReward();
    }
  }
}
