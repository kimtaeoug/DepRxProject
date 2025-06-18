// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kbads_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KBADSValueModelImpl _$$KBADSValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KBADSValueModelImpl(
      activation: json['activation'] == null
          ? const KBADSDetailModel()
          : KBADSDetailModel.fromJson(
              json['activation'] as Map<String, dynamic>),
      aae: json['aae'] == null
          ? const KBADSDetailModel()
          : KBADSDetailModel.fromJson(json['aae'] as Map<String, dynamic>),
      jaal: json['jaal'] == null
          ? const KBADSDetailModel()
          : KBADSDetailModel.fromJson(json['jaal'] as Map<String, dynamic>),
      sl: json['sl'] == null
          ? const KBADSDetailModel()
          : KBADSDetailModel.fromJson(json['sl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KBADSValueModelImplToJson(
        _$KBADSValueModelImpl instance) =>
    <String, dynamic>{
      'activation': instance.activation,
      'aae': instance.aae,
      'jaal': instance.jaal,
      'sl': instance.sl,
    };
