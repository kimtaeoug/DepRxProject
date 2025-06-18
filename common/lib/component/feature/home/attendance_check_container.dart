
import 'package:common/common.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import '../../common/ba_item_container.dart';
import 'attendance_progress_bar.dart';
import 'attendence_day.dart';


class AttendanceCheckContainer extends StatefulWidget {
  final String weekData;
  final List<AttendanceDayModel> dayList;
  final Map<int, List<BAModel>> baList;
  final int currentIdx;
  final Function(int idx)? gaFunction;
  AttendanceCheckContainer(
      {super.key,
      required this.weekData,
      required this.dayList,
      required this.baList,
      required this.currentIdx,
      this.gaFunction});

  @override
  State<StatefulWidget> createState() => _AttendanceCheckContainer();
}

class _AttendanceCheckContainer extends State<AttendanceCheckContainer> {
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

  late final List<Widget> _baList = List.generate(widget.baList.length, (idx) {
    int dayIdx = widget.dayList[idx].day;
    List<BAModel> baList = widget.baList[dayIdx] ?? [];
    int doneLength = baList.where((e) => e.done == true).length;
    if (baList.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(baList.length, (idx) {
              BAModel data = baList[idx];
              return Padding(
                padding: EdgeInsets.only(
                    bottom: idx == 0 ? 12 : 0, left: 2, right: 2),
                child: BAItemContainer(
                  data: data,
                  function: () {
                    if (_attendanceLoad) {
                      ToastHandler().show('inspectionWait_overview_title'.tr, isError: true);
                    } else {
                      if (!data.done && (currentIdx == todayIdx)) {
                        Get.toNamed(Routes.activityEmotionPage, arguments: {
                          'data': data.activityId,
                          'isBefore': true,
                          'fromHome': true
                        });
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
          AttendanceProgressBar(value: doneLength, totalLength: baList.length)
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
                    if(widget.gaFunction != null){
                      widget.gaFunction?.call(idx);
                    }
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
