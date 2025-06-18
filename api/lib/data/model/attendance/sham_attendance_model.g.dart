// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sham_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShamAttendanceModelImpl _$$ShamAttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ShamAttendanceModelImpl(
      attendanceWeek: json['attendanceWeek'] as String? ?? '',
      attendance: (json['attendance'] as List<dynamic>?)
              ?.map((e) =>
                  ShamAttendanceItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShamAttendanceModelImplToJson(
        _$ShamAttendanceModelImpl instance) =>
    <String, dynamic>{
      'attendanceWeek': instance.attendanceWeek,
      'attendance': instance.attendance,
    };
