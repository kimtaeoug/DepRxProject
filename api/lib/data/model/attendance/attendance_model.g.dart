// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      attendanceWeek: json['attendanceWeek'] as String? ?? '',
      attendance: (json['attendance'] as List<dynamic>?)
              ?.map((e) =>
                  AttendanceItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'attendanceWeek': instance.attendanceWeek,
      'attendance': instance.attendance,
    };
