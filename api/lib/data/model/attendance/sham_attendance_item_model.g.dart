// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sham_attendance_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShamAttendanceItemModelImpl _$$ShamAttendanceItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ShamAttendanceItemModelImpl(
      day: (json['day'] as num?)?.toInt() ?? 0,
      todayTaskList: (json['todayTaskList'] as List<dynamic>?)
              ?.map(
                  (e) => TodayTaskItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attended: json['attended'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShamAttendanceItemModelImplToJson(
        _$ShamAttendanceItemModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'todayTaskList': instance.todayTaskList,
      'attended': instance.attended,
    };
