// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceDayModelImpl _$$AttendanceDayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDayModelImpl(
      day: (json['day'] as num?)?.toInt() ?? 0,
      type: $enumDecodeNullable(_$AttendDayTypeEnumMap, json['type']) ??
          AttendDayType.none,
    );

Map<String, dynamic> _$$AttendanceDayModelImplToJson(
        _$AttendanceDayModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'type': _$AttendDayTypeEnumMap[instance.type]!,
    };

const _$AttendDayTypeEnumMap = {
  AttendDayType.attend: 'attend',
  AttendDayType.click: 'click',
  AttendDayType.today: 'today',
  AttendDayType.none: 'none',
};
