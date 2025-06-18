import 'package:freezed_annotation/freezed_annotation.dart';

part 'ongoing_ba_entity.g.dart';
part 'ongoing_ba_entity.freezed.dart';

@freezed
class OngoingBAEntity with _$OngoingBAEntity{
  const factory OngoingBAEntity({
    @Default('') String activityId,
    @Default(0) int beforeEmotion,
    @Default(0) int afterEmotion
  }) = _OngoingBAEntity;
  const OngoingBAEntity._();
  factory OngoingBAEntity.fromJson(Map<String, dynamic> json) => _$OngoingBAEntityFromJson(json);
}