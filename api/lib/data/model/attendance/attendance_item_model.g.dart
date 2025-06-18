// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceItemModelImpl _$$AttendanceItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceItemModelImpl(
      day: (json['day'] as num?)?.toInt() ?? 0,
      baList: (json['baList'] as List<dynamic>?)
              ?.map((e) => BAModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attended: json['attended'] as bool? ?? false,
    );

Map<String, dynamic> _$$AttendanceItemModelImplToJson(
        _$AttendanceItemModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'baList': instance.baList,
      'attended': instance.attended,
    };
