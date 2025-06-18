// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pwd_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPwdEntityImpl _$$ResetPwdEntityImplFromJson(Map<String, dynamic> json) =>
    _$ResetPwdEntityImpl(
      newPassword: json['newPassword'] as String? ?? '',
      newPasswordConfirm: json['newPasswordConfirm'] as String? ?? '',
    );

Map<String, dynamic> _$$ResetPwdEntityImplToJson(
        _$ResetPwdEntityImpl instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'newPasswordConfirm': instance.newPasswordConfirm,
    };
