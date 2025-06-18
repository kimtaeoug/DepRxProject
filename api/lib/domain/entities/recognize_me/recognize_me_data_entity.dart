import 'package:api/domain/entities/recognize_me/recognize_me_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognize_me_data_entity.g.dart';

part 'recognize_me_data_entity.freezed.dart';

@freezed
class RecognizeMeDataEntity with _$RecognizeMeDataEntity {
  const factory RecognizeMeDataEntity(
      {@Default('') String title,
      @Default([]) List<RecognizeMeItemEntity> data}) = _RecognizeMeDataEntity;

  const RecognizeMeDataEntity._();

  factory RecognizeMeDataEntity.fromJson(Map<String, dynamic> json) =>
      _$RecognizeMeDataEntityFromJson(json);
}
