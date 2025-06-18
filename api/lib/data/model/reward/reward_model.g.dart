// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardModelImpl _$$RewardModelImplFromJson(Map<String, dynamic> json) =>
    _$RewardModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      imagePath: json['imagePath'] as String? ?? '',
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      item: json['item'] as String? ?? '',
      why: json['why'] as String? ?? '',
      type: json['type'] as String? ?? '',
      date: json['date'] as String? ?? '',
      rewardId: json['rewardId'] as String? ?? '',
    );

Map<String, dynamic> _$$RewardModelImplToJson(_$RewardModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'imagePath': instance.imagePath,
      'label': instance.label,
      'value': instance.value,
      'item': instance.item,
      'why': instance.why,
      'type': instance.type,
      'date': instance.date,
      'rewardId': instance.rewardId,
    };
