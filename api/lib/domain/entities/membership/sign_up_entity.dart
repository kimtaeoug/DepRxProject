import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_entity.g.dart';

part 'sign_up_entity.freezed.dart';

@freezed
class SignUpEntity with _$SignUpEntity {
  const factory SignUpEntity(
      {@Default('') String code,
      @Default('') String id,
      @Default('') String password,
      @Default(false) bool marketing,
      @Default('') String name,
      @Default('') String gender,
      @Default('') String birth,
      @Default('') String mainAddress,
      @Default('') String detailAddress,
      @Default('') String phoneNumber}) = _SignUpEntity;

  const SignUpEntity._();

  factory SignUpEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpEntityFromJson(json);
}
