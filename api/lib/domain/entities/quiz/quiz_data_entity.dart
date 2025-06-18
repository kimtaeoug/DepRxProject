import 'package:api/domain/entities/quiz/quiz_comment_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_data_entity.g.dart';

part 'quiz_data_entity.freezed.dart';

@freezed
class QuizDataEntity with _$QuizDataEntity {
  const factory QuizDataEntity(
      {@Default(0) int idx,
      @Default('') String title,
      @Default([]) List<String> select,
      @Default(0) int answer,
      @Default([]) List<QuizCommentItemEntity> commentary}) = _QuizDataEntity;

  const QuizDataEntity._();

  factory QuizDataEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizDataEntityFromJson(json);
}
