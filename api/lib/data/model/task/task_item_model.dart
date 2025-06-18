import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_item_model.g.dart';
part 'task_item_model.freezed.dart';

@freezed
class TaskItemModel with _$TaskItemModel{
  const factory TaskItemModel({
    @Default('') String taskName,
    @Default(false) bool done
  }) = _TaskItemModel;
  const TaskItemModel._();
  factory TaskItemModel.fromJson(Map<String, dynamic> json) => _$TaskItemModelFromJson(json);
}