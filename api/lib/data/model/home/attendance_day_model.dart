import 'package:core/types/ba/attend_day_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'attendance_day_model.g.dart';

part 'attendance_day_model.freezed.dart';

@freezed
class AttendanceDayModel with _$AttendanceDayModel {
  const factory AttendanceDayModel(
      {@Default(0) int day,
      @Default(AttendDayType.none) AttendDayType type}) = _AttendanceDayModel;

  const AttendanceDayModel._();

  factory AttendanceDayModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayModelFromJson(json);
}
