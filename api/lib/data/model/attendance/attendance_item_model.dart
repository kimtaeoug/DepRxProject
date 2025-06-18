import 'package:freezed_annotation/freezed_annotation.dart';

import '../activity/ba_model.dart';

part 'attendance_item_model.g.dart';

part 'attendance_item_model.freezed.dart';

@freezed
class AttendanceItemModel with _$AttendanceItemModel {
  const factory AttendanceItemModel(
      {@Default(0) int day,
      @Default([]) List<BAModel> baList,
      @Default(false) bool attended
      }) = _AttendanceItemModel;

  const AttendanceItemModel._();

  factory AttendanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceItemModelFromJson(json);
}
