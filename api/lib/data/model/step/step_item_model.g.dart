// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepItemModelImpl _$$StepItemModelImplFromJson(Map<String, dynamic> json) =>
    _$StepItemModelImpl(
      imagePath: json['imagePath'] as String? ?? '',
      value: json['value'] as String? ?? '',
      date: json['date'] as String? ?? '',
      week: (json['week'] as num?)?.toInt() ?? 0,
      rewardList: (json['rewardList'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StepItemModelImplToJson(_$StepItemModelImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'value': instance.value,
      'date': instance.date,
      'week': instance.week,
      'rewardList': instance.rewardList,
    };
