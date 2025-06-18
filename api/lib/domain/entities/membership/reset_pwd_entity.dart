import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pwd_entity.g.dart';
part 'reset_pwd_entity.freezed.dart';

@freezed
class ResetPwdEntity with _$ResetPwdEntity{
  const factory ResetPwdEntity({
      @Default('') String newPassword,
    @Default('') String newPasswordConfirm
  }) = _ResetPwdEntity;
  const ResetPwdEntity._();
  factory ResetPwdEntity.fromJson(Map<String, dynamic> json ) => _$ResetPwdEntityFromJson(json);
}