import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognize_me_item_entity.g.dart';

part 'recognize_me_item_entity.freezed.dart';

@freezed
class RecognizeMeItemEntity with _$RecognizeMeItemEntity {
  const factory RecognizeMeItemEntity(
      {@Default(0) int idx,
      @Default('') String title,
      @Default('') String hint}) = _RecognizeMeItemEntity;

  const RecognizeMeItemEntity._();

  factory RecognizeMeItemEntity.fromJson(Map<String, dynamic> json) =>
      _$RecognizeMeItemEntityFromJson(json);
}
