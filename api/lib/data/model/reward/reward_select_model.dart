import 'package:freezed_annotation/freezed_annotation.dart';

import 'reward_model.dart';


part 'reward_select_model.g.dart';
part 'reward_select_model.freezed.dart';

@freezed
class RewardSelectModel with _$RewardSelectModel{
  const factory RewardSelectModel({
    @Default(0) int week,
    @Default('') String emotionImage,
    @Default('') String activityImage,
    @Default([]) List<RewardModel> emotion,
    @Default([]) List<RewardModel> activity
  }) = _RewardSelectModel;
  const RewardSelectModel._();
  factory RewardSelectModel.fromJson(Map<String, dynamic> json) => _$RewardSelectModelFromJson(json);
}