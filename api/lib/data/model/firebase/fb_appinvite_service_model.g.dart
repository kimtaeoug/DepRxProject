// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fb_appinvite_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBAppinviteServiceModelImpl _$$FBAppinviteServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FBAppinviteServiceModelImpl(
      other_platform_oauth_client:
          (json['other_platform_oauth_client'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$FBAppinviteServiceModelImplToJson(
        _$FBAppinviteServiceModelImpl instance) =>
    <String, dynamic>{
      'other_platform_oauth_client': instance.other_platform_oauth_client,
    };
