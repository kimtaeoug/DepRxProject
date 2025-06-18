import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_task_item_model.g.dart';

part 'today_task_item_model.freezed.dart';

@freezed
class TodayTaskItemModel with _$TodayTaskItemModel {
  const factory TodayTaskItemModel(
      {@Default('') String date,
      @Default('') String imagePath,
      @Default('') String contents,
      @Default(false) bool done}) = _TodayTaskItemModel;

  const TodayTaskItemModel._();

  factory TodayTaskItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodayTaskItemModelFromJson(json);
}
