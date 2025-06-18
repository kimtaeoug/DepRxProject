import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.g.dart';

part 'reward_model.freezed.dart';

@freezed
class RewardModel with _$RewardModel {
  const factory RewardModel(
      {@Default(0) int week,
      @Default('') String imagePath,
      @Default('') String label,
      @Default('') String value,
      @Default('') String item,
      @Default('') String why,
      @Default('') String type,
      @Default('') String date,
      @Default('') String rewardId}) = _RewardModel;

  const RewardModel._();

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
}
