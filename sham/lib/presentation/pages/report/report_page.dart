import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../controllers/report/report_controller.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReportPage();
}

class _ReportPage extends State<ReportPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final ReportController _controller = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.reportMain, isDeprx: false);
    _controller.initReportTotalList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);

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
              if (_controller.totalReportLoading.value) {
                return LoadingFrame();
              } else {
                RxList<WeekReportItemModel> dataList =
                    _controller.totalReportList;
                if (dataList.isEmpty) {
                  return ReportEmptyContainer();
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: _screenUtil.topPadding),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 20),
                              child: SizedBox(
                                width: _screenUtil.width,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'reportMain_overview_title'.tr,
                                    style: _titleStyle,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:
                                  List.generate(dataList.value.length, (idx) {
                                WeekReportItemModel data = dataList.value[idx];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: GestureDetector(
                                    onTap: () {
                                      GAUtil.trackEvent(
                                          name:
                                          GAEventList.WEEKLY_REPORT_ITEM_CLICK,
                                          params: {
                                            GAParameter.WEEK: data.week,
                                            GAParameter.PROGRESS_RATE: data.rate
                                          }, isDeprx: false);
                                      _reportFunction(data);
                                    },
                                    child: ReportItem(
                                        label:
                                            '${data.week}${'common_week'.tr}',
                                        value: data.rate),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }),
          ),
        ));
  }

  void _reportFunction(WeekReportItemModel data) {
    Get.toNamed(Routes.reportDetailPage,
        arguments: {'week': data.week}, preventDuplicates: false);
  }
}
