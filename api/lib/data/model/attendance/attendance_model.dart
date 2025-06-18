import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance_item_model.dart';

part 'attendance_model.g.dart';

part 'attendance_model.freezed.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel(
      {@Default('') String attendanceWeek,
      @Default([]) List<AttendanceItemModel> attendance}) = _AttendanceModel;

  const AttendanceModel._();

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
}
