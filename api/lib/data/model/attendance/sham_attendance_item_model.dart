import 'package:api/data/model/task/today_task_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sham_attendance_item_model.g.dart';
part 'sham_attendance_item_model.freezed.dart';

@freezed
class ShamAttendanceItemModel with _$ShamAttendanceItemModel {
  const factory ShamAttendanceItemModel(
      {@Default(0) int day,
      @Default([]) List<TodayTaskItemModel> todayTaskList,
      @Default(false) bool attended}) = _ShamAttendanceItemModel;

  const ShamAttendanceItemModel._();

  factory ShamAttendanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShamAttendanceItemModelFromJson(json);
}
