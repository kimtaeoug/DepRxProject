import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_entity.g.dart';
part 'social_login_entity.freezed.dart';

@freezed
class SocialLoginEntity with _$SocialLoginEntity{
  const factory SocialLoginEntity({
    @Default('') String socialsUuid,
    @Default('') String socialsType,
    @Default(false) bool force,
    @Default('') String fcmToken
  }) = _SocialLoginEntity;
  const SocialLoginEntity._();
  factory SocialLoginEntity.fromJson(Map<String, dynamic> json) => _$SocialLoginEntityFromJson(json);
}