// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fb_client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBClientModelImpl _$$FBClientModelImplFromJson(Map<String, dynamic> json) =>
    _$FBClientModelImpl(
      client_info: json['client_info'] == null
          ? const FBClientInfoModel()
          : FBClientInfoModel.fromJson(
              json['client_info'] as Map<String, dynamic>),
      oauth_client: (json['oauth_client'] as List<dynamic>?)
              ?.map((e) => OauthClientModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      api_key: (json['api_key'] as List<dynamic>?)
              ?.map(
                  (e) => FBAPIKeyItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      services: json['services'] == null
          ? const FBServicesModel()
          : FBServicesModel.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FBClientModelImplToJson(_$FBClientModelImpl instance) =>
    <String, dynamic>{
      'client_info': instance.client_info,
      'oauth_client': instance.oauth_client,
      'api_key': instance.api_key,
      'services': instance.services,
    };
