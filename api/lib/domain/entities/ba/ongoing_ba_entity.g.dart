// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_ba_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OngoingBAEntityImpl _$$OngoingBAEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OngoingBAEntityImpl(
      activityId: json['activityId'] as String? ?? '',
      beforeEmotion: (json['beforeEmotion'] as num?)?.toInt() ?? 0,
      afterEmotion: (json['afterEmotion'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OngoingBAEntityImplToJson(
        _$OngoingBAEntityImpl instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'beforeEmotion': instance.beforeEmotion,
      'afterEmotion': instance.afterEmotion,
    };
