import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DpCalendar extends StatefulWidget {
  DateTime selectedDate;
  final Function(DateTime, DateTime) onDaySelected;
  final Widget header;
  final bool isMonthOverflow;
  final Function(DateTime) onPageChanged;
  final DateTime startDate;
  final DateTime endDate;

  DpCalendar(
      {Key? key,
      required this.selectedDate,
      required this.onDaySelected,
      required this.header,
      this.isMonthOverflow = false,
      required this.onPageChanged,
      required this.startDate,
      required this.endDate});

  @override
  State<StatefulWidget> createState() => _DpCalendar();
}

class _DpCalendar extends State<DpCalendar> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: TableCalendar(
        availableGestures: AvailableGestures.none,
        currentDay: now,
        daysOfWeekHeight: 31,
        rowHeight: 48,
        focusedDay: widget.selectedDate,
        selectedDayPredicate: (date) => isSameDay(widget.selectedDate, date),
        firstDay: widget.startDate,
        lastDay: widget.endDate,
        calendarBuilders: _calendarBuilders,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        locale: KO_KR,
        onDaySelected: widget.onDaySelected,
        onPageChanged: widget.onPageChanged,
        headerVisible: true,
        headerStyle: const HeaderStyle(
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: false,
            headerMargin: EdgeInsets.zero,
            headerPadding: EdgeInsets.only(left: 20, right: 12, bottom: 10)),
      ),
    );
  }

  final TextStyle _dayOfTheWeekStyle = DpTextStyle.b3.style.copyWith(
    color: DColors.labelAlternativeColor2,
  );
  final TextStyle _defaultDayStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _disabledDayStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAssistiveColor2);
  final TextStyle _selectedDayStyle = DpTextStyle.b2.style.copyWith(
    color: DColors.white,
  );

  late final CalendarBuilders _calendarBuilders = CalendarBuilders(
      headerTitleBuilder: (context, date) {
        return widget.header;
      },
      selectedBuilder: (context, date1, date2) {
        return Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: DColors.primaryNormalColor),
          child: Center(
            child: Text(
              date1.day.toString(),
              style: _selectedDayStyle,
            ),
          ),
        );
      },
      disabledBuilder: (context, date1, date2) =>
          _defaultItem(context, date1, date2, isDisable: true),
      defaultBuilder: _defaultItem,
      todayBuilder: (_, date, date2) {
        return Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: DColors.labelDisableColor3),
          child: Center(
            child: Text(
              date.day.toString(),
              style: _defaultDayStyle,
            ),
          ),
        );
      },
      outsideBuilder: (context, date1, date2) =>
          _defaultItem(context, date1, date2, isDisable: true),
      dowBuilder: (context, date) {
        return SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: Text(
              TimeUtil.convertDateToDayOfWeek(date),
              style:
                  _startEndCheck(date) ? _defaultDayStyle : _dayOfTheWeekStyle,
            ),
          ),
        );
      });

  bool _startEndCheck(DateTime time) {
    if (time.isBefore(widget.endDate) && time.isAfter(widget.startDate)) {
      return true;
    } else {
      return false;
    }
  }

  Widget _defaultItem(BuildContext context, DateTime date1, DateTime date2,
      {bool isDisable = false}) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Center(
        child: Text(
          date1.day.toString(),
          style: isDisable ?  _disabledDayStyle : _defaultDayStyle
        ),
      ),
    );
  }
}
