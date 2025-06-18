import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  //date -> year month
  static String convertDateTo(DateTime time, String format) {
    return DateFormat(format).format(time);
  }

  static String convertDateToDot(String date) {
    DateTime? dateTime = DateTime.tryParse(date);
    if(dateTime != null){
      return '${dateTime.year}.${twoDigit(dateTime.month)}.${twoDigit(dateTime.day)}';
    }else{
      DateTime now = DateTime.now();
      return '${now.year}.${twoDigit(now.month)}.${twoDigit(now.day)}';
    }
  }

  //date to 요일
  static String convertDateToDayOfWeek(DateTime time) {
    return DateFormat('E', 'ko_KR').format(time);
  }

  //한달전
  static DateTime calBeforeMonth(DateTime input) {
    int year = input.year;
    int month = input.month;
    int day = input.day;
    if (month == 1) {
      month = 12;
      year -= 1;
    } else {
      month -= 1;
    }
    return DateTime(year, month, day);
  }

  //한달후
  static DateTime calAfterMonth(DateTime input) {
    int year = input.year;
    int month = input.month;
    int day = input.day;
    if (month == 12) {
      month = 1;
      year += 1;
    } else {
      month += 1;
    }
    return DateTime(year, month, day);
  }

  //2024-09-28 7:42
  //2024-09-10 18:32:34.447983
  //2024-09-28 7:42
  //am pm
  static String covertDateToAMPM(String input) {
    DateTime date = DateTime.parse(input);
    int hour = date.hour;
    String ampm = 'common_time_am'.tr;
    if (date.hour > 12) {
      ampm = 'common_time_pm'.tr;
      hour = hour - 12;
    }
    return '$ampm ${twoDigit(hour)}:${twoDigit(date.minute)}';
  }

  static String parseErrorCase(String input) {
    return '$input:00';
  }

  static String twoDigit(int input) {
    if (input < 10) {
      return '0${input}';
    } else {
      return input.toString();
    }
  }

  static String getDayOfWeek(DateTime input) {
    return DateFormat('E', 'ko_KR').format(input);
  }
}
