import 'package:freezed_annotation/freezed_annotation.dart';

import 'reward_model.dart';


part 'final_reward_model.g.dart';
part 'final_reward_model.freezed.dart';

@freezed
class FinalRewardModel with _$FinalRewardModel{
  const factory FinalRewardModel({
    @Default('') String header,
    @Default('') String imagePath,
    @Default('') String contents,
    @Default('') String date,
    @Default('') String why,
    @Default([]) List<RewardModel> rewardList
  }) = _FinalRewardModel;
  const FinalRewardModel._();
  factory FinalRewardModel.fromJson(Map<String, dynamic> json) => _$FinalRewardModelFromJson(json);
}