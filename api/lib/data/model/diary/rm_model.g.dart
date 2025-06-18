// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RmModelImpl _$$RmModelImplFromJson(Map<String, dynamic> json) =>
    _$RmModelImpl(
      date: json['date'] as String? ?? '',
      answerList: (json['answerList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RmModelImplToJson(_$RmModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'answerList': instance.answerList,
    };
