// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageAlarmModelImpl _$$MyPageAlarmModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyPageAlarmModelImpl(
      availableTimes: (json['availableTimes'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MyPageAlarmModelImplToJson(
        _$MyPageAlarmModelImpl instance) =>
    <String, dynamic>{
      'availableTimes': instance.availableTimes,
    };
