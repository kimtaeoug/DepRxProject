// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizDataEntityImpl _$$QuizDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$QuizDataEntityImpl(
      idx: (json['idx'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      select: (json['select'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      answer: (json['answer'] as num?)?.toInt() ?? 0,
      commentary: (json['commentary'] as List<dynamic>?)
              ?.map((e) =>
                  QuizCommentItemEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuizDataEntityImplToJson(
        _$QuizDataEntityImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'title': instance.title,
      'select': instance.select,
      'answer': instance.answer,
      'commentary': instance.commentary,
    };
