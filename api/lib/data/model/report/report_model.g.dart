// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      achieveRate: (json['achieveRate'] as num?)?.toInt() ?? 0,
      kbadsResult: json['kbadsResult'] == null
          ? const KBADSValueModel()
          : KBADSValueModel.fromJson(
              json['kbadsResult'] as Map<String, dynamic>),
      rewardList: (json['rewardList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      baList: (json['baList'] as List<dynamic>?)
              ?.map(
                  (e) => ReportBAItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'achieveRate': instance.achieveRate,
      'kbadsResult': instance.kbadsResult,
      'rewardList': instance.rewardList,
      'baList': instance.baList,
    };
