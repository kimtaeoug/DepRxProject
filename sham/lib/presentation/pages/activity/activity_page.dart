import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryController _controller = Get.find();

  final GlobalKey key = GlobalKey();
  double calendarHeight = 0;
  bool _isDateOverFlow = false;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.activityMain, isDeprx: false);
    _controller.getProgramInfo();
    _controller.initMonthTask(_controller.selectedData.value);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Size? size = UIUtil.widgetSize(key);
      if (size != null) {
        setState(() {
          calendarHeight = size.height;
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
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Obx(() {
              return !(_controller.programLoading.value ||
                      _controller.monthLoading.value)
                  ? SingleChildScrollView(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: _screenUtil.width,
                            height: _screenUtil.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: _screenUtil.width,
                                  height: calendarHeight != 0
                                      ? _screenUtil.height - calendarHeight
                                      : _screenUtil.height / 2,
                                  color: DColors.white,
                                ),
                                Container(
                                  width: _screenUtil.width,
                                  height: calendarHeight != 0
                                      ? calendarHeight
                                      : _screenUtil.height / 2,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    color: DColors.bgBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: _screenUtil.width,
                            height: _screenUtil.height,
                            child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: _screenUtil.topPadding,
                                      ),
                                      Container(
                                        key: key,
                                        width: _screenUtil.width,
                                        color: DColors.white,
                                        padding: _screenUtil.defaultAllMargin,
                                        child: DpCalendar(
                                          selectedDate:
                                              _controller.selectedData.value,
                                          onDaySelected: (date1, date2) {
                                            _controller.selectedData.value =
                                                date2;
                                          },
                                          header: _header(),
                                          onPageChanged: (date) {
                                            _controller.selectedData.value =
                                                date;
                                          },
                                          startDate:
                                              _controller.startDate.value,
                                          endDate: _controller.endDate.value,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Container(
                                    width: _screenUtil.width,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                        color: DColors.bgBlueColor),
                                    child: _dataList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SmallLoadingFrame();
            }),
          ),
        ));
  }

  ///
  /// Date List
  ///
  Widget _dataList() {
    bool existing =
        _controller.checkDateExisting(_controller.selectedData.value);
    if (existing) {
      TaskModel rawData =
          _controller.getSelectedDay(_controller.selectedData.value);
      List<TaskItemModel> data = rawData.taskList;
      if (data.isNotEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _dateLabel(rawData.week),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: _screenUtil.defaultHorizontalMargin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(data.length, (idx) {
                  TaskItemModel item = data[idx];
                  DiaryType type = DiaryTypeExtension.whichDiary(item.taskName);
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: idx != data.length - 1 ? 12 : 80),
                    child: TTItemContainer(
                      data: TodayTaskItemModel(
                          contents: item.taskName, done: item.done),
                      type: type,
                      function: () {
                        bool isToday = isSameDay(
                            _controller.selectedData.value, _controller.now);
                        DiaryTypeExtension.processDiaryPage(type, item.done,
                            isToday: isToday,
                            data: item.done
                                ? type == DiaryType.rm
                                    ? rawData.week
                                    : _controller.selectedData.value
                                : null);
                      },
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            _emptyData()
          ],
        );
      }
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          _emptyData(isAfter: false)
        ],
      );
    }
  }

  //dummyBaList

  ///
  /// Date Item
  ///
  final TextStyle _dateStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNeutralColor2);

  Widget _dateLabel(int week) {
    return SizedBox(
      width: _screenUtil.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 20),
        child: Text(
          '$week주차',
          style: _dateStyle,
        ),
      ),
    );
  }

  ///
  /// Empty Item
  ///

  final TextStyle _emptyStyle =
      DpTextStyle.b6.style.copyWith(color: DColors.labelNeutralColor2);

  Widget _emptyData({bool isAfter = true}) {
    return Padding(
      padding: _screenUtil.defaultHorizontalMargin,
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.symmetric(vertical: 26),
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius20, color: DColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Resource.icon('ic_exclamation_mark', width: 24, height: 24),
            const SizedBox(
              height: 12,
            ),
            Text(
              isAfter ? '아직 기록하기 전 활동이에요'.tr : 'common_emptyActivity'.tr,
              style: _emptyStyle,
            )
          ],
        ),
      ),
    );
  }

  ///
  /// calendar
  ///
  final TextStyle _todayStyle = DpTextStyle.detail1.style.copyWith();

  Widget _today({bool isShow = true}) {
    return GestureDetector(
      onTap: () {
        DateTime now = DateTime.now();
        _controller.selectedData.value = now;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                color:
                    isShow ? DColors.lineNeutralColor : DColors.transparent)),
        child: Text(
          'activityMain_today'.tr,
          style: _todayStyle.copyWith(
              color: isShow ? DColors.labelNeutralColor2 : DColors.transparent),
        ),
      ),
    );
  }

  final TextStyle _headerTextStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.black);

  Widget _header() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 6.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _today(isShow: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _arrowBtn(isLeft: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  TimeUtil.convertDateTo(_controller.selectedData.value,
                      'yyyy${'activityMain_year'.tr} MM${'activityMain_month'.tr}'),
                  style: _headerTextStyle,
                ),
              ),
              _arrowBtn()
            ],
          ),
          _today(isShow: !_isDateOverFlow)
        ],
      ),
    );
  }

  Widget _arrowBtn({bool isLeft = false}) {
    return GestureDetector(
      onTap: () {
        if (isLeft) {
          _controller.calendarLeftFunction();
        } else {
          _controller.calendarRightFunction();
        }
        _controller.initMonthTask(_controller.selectedData.value,
            showToast: true);
      },
      child: Resource.icon('ic_arrow_${isLeft ? 'left' : 'right'}_blue',
          width: 24,
          height: 24,
          colorFilter:
              const ColorFilter.mode(DColors.arrowIconColor, BlendMode.srcIn)),
    );
  }
}
