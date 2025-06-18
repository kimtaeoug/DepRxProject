// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardTotalModelImpl _$$RewardTotalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardTotalModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      stamp: (json['stamp'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      emotion: (json['emotion'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activity: (json['activity'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RewardTotalModelImplToJson(
        _$RewardTotalModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'stamp': instance.stamp,
      'emotion': instance.emotion,
      'activity': instance.activity,
    };
