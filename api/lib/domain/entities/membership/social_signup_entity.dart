import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_signup_entity.g.dart';
part 'social_signup_entity.freezed.dart';
@freezed
class SocialSignupEntity with _$SocialSignupEntity{
  const factory SocialSignupEntity({
    @Default('') String code,
    @Default('') String socialsUuid,
    @Default('') String socialsType,
    @Default(false) bool marketing,
    @Default('') String name,
    @Default('') String gender,
    @Default('') String birth,
    @Default('') String mainAddress,
    @Default('') String detailAddress,
    @Default('') String phoneNumber
  }) = _SocialSignupEntity;
  const SocialSignupEntity._();
  factory SocialSignupEntity.fromJson(Map<String, dynamic> json) => _$SocialSignupEntityFromJson(json);
}