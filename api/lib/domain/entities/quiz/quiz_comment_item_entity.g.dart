// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_comment_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizCommentItemEntityImpl _$$QuizCommentItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizCommentItemEntityImpl(
      number: (json['number'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$$QuizCommentItemEntityImplToJson(
        _$QuizCommentItemEntityImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'comment': instance.comment,
    };
