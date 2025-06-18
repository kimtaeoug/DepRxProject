// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kbads_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KBADSDetailModelImpl _$$KBADSDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KBADSDetailModelImpl(
      score: (json['score'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$KBADSDetailModelImplToJson(
        _$KBADSDetailModelImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
    };
