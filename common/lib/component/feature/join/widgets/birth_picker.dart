import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class BirthPicker extends StatelessWidget {
  final DateTime dateTime;
  final Function(DateTime) onDateTimeChanged;
  final Widget header;
  final DateTime initialTime;

  BirthPicker(
      {Key? key,
      required this.dateTime,
      required this.onDateTimeChanged,
      required this.header,
      required this.initialTime})
      : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.only(top: 28, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: DColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: DColors.black.withValues(alpha: 0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: header,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: _screenUtil.width,
            height: 228,
            child: CupertinoDatePicker(
              initialDateTime: initialTime,
              minimumDate: DateTime(now.year - 100, 1, 1),
              maximumDate: now,
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              onDateTimeChanged: onDateTimeChanged,
              backgroundColor: DColors.transparent,
              dateOrder: DatePickerDateOrder.mdy,
            ),
          )
        ],
      ),
    );
  }
}
