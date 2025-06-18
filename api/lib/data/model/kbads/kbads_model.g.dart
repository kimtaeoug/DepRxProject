// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kbads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KbadsModelImpl _$$KbadsModelImplFromJson(Map<String, dynamic> json) =>
    _$KbadsModelImpl(
      activation: json['activation'] == null
          ? const KbadsItemModel()
          : KbadsItemModel.fromJson(json['activation'] as Map<String, dynamic>),
      aae: json['aae'] == null
          ? const KbadsItemModel()
          : KbadsItemModel.fromJson(json['aae'] as Map<String, dynamic>),
      sl: json['sl'] == null
          ? const KbadsItemModel()
          : KbadsItemModel.fromJson(json['sl'] as Map<String, dynamic>),
      jaal: json['jaal'] == null
          ? const KbadsItemModel()
          : KbadsItemModel.fromJson(json['jaal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KbadsModelImplToJson(_$KbadsModelImpl instance) =>
    <String, dynamic>{
      'activation': instance.activation,
      'aae': instance.aae,
      'sl': instance.sl,
      'jaal': instance.jaal,
    };
