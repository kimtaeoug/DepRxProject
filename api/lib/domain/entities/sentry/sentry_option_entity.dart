import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentry_option_entity.g.dart';

part 'sentry_option_entity.freezed.dart';

@freezed
class SentryOptionEntity with _$SentryOptionEntity {
  const factory SentryOptionEntity(
      {@Default('') String service,
      @Default('') String release,
      @Default('') String os,
      @Default('') String network,
      @Default('') String endpoint,
      @Default('') String statusCode,
      @Default('') String method,
      @Default('') String apiVersion}) = _SentryOptionEntity;
  const SentryOptionEntity._();

  factory SentryOptionEntity.fromJson(Map<String, dynamic> json) =>
      _$SentryOptionEntityFromJson(json);
}
