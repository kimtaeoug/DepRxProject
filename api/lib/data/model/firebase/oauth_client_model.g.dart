// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OauthClientModelImpl _$$OauthClientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OauthClientModelImpl(
      client_id: json['client_id'] as String? ?? '',
      client_type: (json['client_type'] as num?)?.toInt() ?? 0,
      android_info: json['android_info'] ?? null,
    );

Map<String, dynamic> _$$OauthClientModelImplToJson(
        _$OauthClientModelImpl instance) =>
    <String, dynamic>{
      'client_id': instance.client_id,
      'client_type': instance.client_type,
      'android_info': instance.android_info,
    };
