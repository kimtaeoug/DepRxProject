// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fb_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBServicesModelImpl _$$FBServicesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FBServicesModelImpl(
      services: json['services'] == null
          ? const FBAppinviteServiceModel()
          : FBAppinviteServiceModel.fromJson(
              json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FBServicesModelImplToJson(
        _$FBServicesModelImpl instance) =>
    <String, dynamic>{
      'services': instance.services,
    };
