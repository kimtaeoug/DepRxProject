// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_ba_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportBAItemModelImpl _$$ReportBAItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportBAItemModelImpl(
      dateLabel: json['dateLabel'] as String? ?? '',
      baList: (json['baList'] as List<dynamic>?)
              ?.map((e) => BAModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReportBAItemModelImplToJson(
        _$ReportBAItemModelImpl instance) =>
    <String, dynamic>{
      'dateLabel': instance.dateLabel,
      'baList': instance.baList,
    };
