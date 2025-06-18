import 'package:api/data/model/attendance/sham_attendance_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sham_attendance_model.g.dart';

part 'sham_attendance_model.freezed.dart';

@freezed
class ShamAttendanceModel with _$ShamAttendanceModel {
  const factory ShamAttendanceModel({
    @Default('') String attendanceWeek,
    @Default([]) List<ShamAttendanceItemModel> attendance,
  }) = _ShamAttendanceModel;

  const ShamAttendanceModel._();

  factory ShamAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$ShamAttendanceModelFromJson(json);
}
