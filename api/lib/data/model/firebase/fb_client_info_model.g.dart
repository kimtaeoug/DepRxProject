// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fb_client_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBClientInfoModelImpl _$$FBClientInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FBClientInfoModelImpl(
      mobilesdk_app_id: json['mobilesdk_app_id'] as String? ?? '',
      android_client_info: json['android_client_info'] == null
          ? const FBAndroidClientInfoModel()
          : FBAndroidClientInfoModel.fromJson(
              json['android_client_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FBClientInfoModelImplToJson(
        _$FBClientInfoModelImpl instance) =>
    <String, dynamic>{
      'mobilesdk_app_id': instance.mobilesdk_app_id,
      'android_client_info': instance.android_client_info,
    };
