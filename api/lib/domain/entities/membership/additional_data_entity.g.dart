// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdditionalDataEntityImpl _$$AdditionalDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionalDataEntityImpl(
      tovList: (json['tovList'] as List<dynamic>?)
              ?.map((e) => TOVListEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      alphaData: json['alphaData'] == null
          ? const AlphaDataEntity()
          : AlphaDataEntity.fromJson(json['alphaData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdditionalDataEntityImplToJson(
        _$AdditionalDataEntityImpl instance) =>
    <String, dynamic>{
      'tovList': instance.tovList,
      'alphaData': instance.alphaData,
    };
