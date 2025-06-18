import 'package:freezed_annotation/freezed_annotation.dart';

import 'reward_model.dart';


part 'reward_total_model.g.dart';
part 'reward_total_model.freezed.dart';


@freezed
class RewardTotalModel with _$RewardTotalModel{
  const factory RewardTotalModel({
    @Default(0) int week,
    @Default([]) List<RewardModel> stamp,
    @Default([]) List<RewardModel> emotion,
    @Default([]) List<RewardModel> activity
  }) = _RewardTotalModel;
  const RewardTotalModel._();
  factory RewardTotalModel.fromJson(Map<String, dynamic> json) => _$RewardTotalModelFromJson(json);
}