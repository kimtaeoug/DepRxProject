import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.g.dart';
part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity{
  const factory LoginEntity({
    @Default('') String id,
    @Default('') String password,
    @Default(false) bool force,
    @Default('') String fcmToken
  }) = _LoginEntity;
  const LoginEntity._();
  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);
}