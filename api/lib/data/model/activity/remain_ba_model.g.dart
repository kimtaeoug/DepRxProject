// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remain_ba_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemainBAModelImpl _$$RemainBAModelImplFromJson(Map<String, dynamic> json) =>
    _$RemainBAModelImpl(
      remainActivity: (json['remainActivity'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RemainBAModelImplToJson(_$RemainBAModelImpl instance) =>
    <String, dynamic>{
      'remainActivity': instance.remainActivity,
    };
