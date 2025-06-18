// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_report_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekReportItemModelImpl _$$WeekReportItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekReportItemModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      rate: (json['rate'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WeekReportItemModelImplToJson(
        _$WeekReportItemModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'rate': instance.rate,
    };
