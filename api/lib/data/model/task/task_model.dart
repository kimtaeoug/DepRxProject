import 'package:api/data/model/task/task_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.g.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel(
      {@Default(0) int week,
      @Default(0) int day,
      @Default([]) List<TaskItemModel> taskList}) = _TaskModel;

  const TaskModel._();

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
