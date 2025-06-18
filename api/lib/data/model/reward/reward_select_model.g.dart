// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_select_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardSelectModelImpl _$$RewardSelectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardSelectModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      emotionImage: json['emotionImage'] as String? ?? '',
      activityImage: json['activityImage'] as String? ?? '',
      emotion: (json['emotion'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activity: (json['activity'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RewardSelectModelImplToJson(
        _$RewardSelectModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'emotionImage': instance.emotionImage,
      'activityImage': instance.activityImage,
      'emotion': instance.emotion,
      'activity': instance.activity,
    };
