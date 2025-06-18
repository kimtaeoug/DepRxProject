import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:common/common.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class ShamAttendanceCheckContainer extends StatefulWidget {
  final String weekData;
  final List<AttendanceDayModel> dayList;
  final Map<int, List<TodayTaskItemModel>> ttList;
  final int currentIdx;
  final int week;

  const ShamAttendanceCheckContainer(
      {super.key,
      required this.weekData,
      required this.dayList,
      required this.ttList,
      required this.currentIdx,
      required this.week});

  @override
  State<StatefulWidget> createState() => _ShamAttendanceCheckContainer();
}

class _ShamAttendanceCheckContainer
    extends State<ShamAttendanceCheckContainer> {
  final PageController _pageController = PageController();
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _weekStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelAlternativeColor2);
  int currentIdx = -1;
  bool _isInit = true;
  final DateTime now = DateTime.now();
  int todayIdx = 0;

  late final List<Widget> _baList = List.generate(widget.ttList.length, (idx) {
    AttendanceDayModel dayModel = widget.dayList[idx];
    int dayIdx = dayModel.day;
    List<TodayTaskItemModel> todayTaskList = widget.ttList[dayIdx] ?? [];
    int doneLength = todayTaskList.where((e) => e.done == true).length;
    if (todayTaskList.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(todayTaskList.length, (idx) {
              TodayTaskItemModel data = todayTaskList[idx];
              DiaryType type = DiaryTypeExtension.whichDiary(data.contents);
              return Padding(
                padding: EdgeInsets.only(
                    bottom: idx != todayTaskList.length - 1 ? 12 : 0,
                    left: 2,
                    right: 2),
                child: TTItemContainer(
                  data: data,
                  type: type,
                  function: () {
                    if (_attendanceLoad) {
                      ToastHandler().show('inspectionWait_overview_title'.tr,
                          isError: true);
                    } else {
                      if (dayModel.type == AttendDayType.today) {
                        DiaryTypeExtension.processDiaryPage(type, data.done,
                            isToday: dayModel.type == AttendDayType.today,
                            data: data.done
                                ? type == DiaryType.rm
                                    ? widget.week
                                    : DateTime.tryParse(data.date)
                                : null);
                      }else{
                        ToastHandler().show('activity_only_today'.tr, isError: true);
                      }
                    }
                  },
                ),
              );
            }),
          ),
          const SizedBox(
            height: 12,
          ),
          AttendanceProgressBar(
              value: doneLength, totalLength: todayTaskList.length)
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  });

  bool _attendanceLoad = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int where = widget.dayList.indexWhere((e) => e.day == now.day);
      setState(() {
        todayIdx = where;
        currentIdx = where;
        _attendanceLoad = false;
      });
      _pageController.jumpToPage(currentIdx);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: DColors.bgLightGray),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'main_attendance_title'.tr,
                    style: _titleStyle,
                  ),
                  Text(
                    widget.weekData,
                    style: _weekStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(widget.dayList.length, (idx) {
                AttendanceDayModel data = widget.dayList[idx];
                bool isToday =
                    isSameDay(now, DateTime(now.year, now.month, data.day));
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIdx = idx;
                      if (_isInit) {
                        _isInit = false;
                      }
                    });
                    _pageController.jumpToPage(currentIdx);
                  },
                  child: AttendenceDay(
                    day: data.day,
                    type: idx == currentIdx ? AttendDayType.click : data.type,
                    isToday: isToday,
                    isInit: _isInit,
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(
              children: [
                Container(
                  width: _screenUtil.width,
                  height: 210,
                  color: DColors.transparent,
                ),
                SizedBox(
                  width: _screenUtil.width,
                  child: ExpandablePageView(
                    controller: _pageController,
                    pageSnapping: false,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _baList,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
