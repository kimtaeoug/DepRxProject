import 'package:freezed_annotation/freezed_annotation.dart';

import '../reward/reward_model.dart';

part 'step_item_model.g.dart';

part 'step_item_model.freezed.dart';

@freezed
class StepItemModel with _$StepItemModel {
  const factory StepItemModel(
      {@Default('') String imagePath,
      @Default('') String value,
      @Default('') String date,
      @Default(0) int week,
      @Default([]) List<RewardModel> rewardList}) = _StepItemModel;

  const StepItemModel._();

  factory StepItemModel.fromJson(Map<String, dynamic> json) =>
      _$StepItemModelFromJson(json);
}
