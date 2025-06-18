import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_entity.g.dart';

part 'fcm_entity.freezed.dart';

@freezed
class FCMEntity with _$FCMEntity {
  const factory FCMEntity(dynamic data, String functionName) = _FCMEntity;

  const FCMEntity._();

  factory FCMEntity.fromJson(Map<String, dynamic> json) =>
      _$FCMEntityFromJson(json);
}
