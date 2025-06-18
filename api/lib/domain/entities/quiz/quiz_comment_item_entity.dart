import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_comment_item_entity.g.dart';

part 'quiz_comment_item_entity.freezed.dart';

@freezed
class QuizCommentItemEntity with _$QuizCommentItemEntity {
  const factory QuizCommentItemEntity(
      {@Default(0) int number, @Default('') String comment}) = _QuizCommentItemEntity;

  const QuizCommentItemEntity._();

  factory QuizCommentItemEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizCommentItemEntityFromJson(json);
}
