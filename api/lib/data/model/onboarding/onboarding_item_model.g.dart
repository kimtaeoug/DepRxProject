// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnBoardingItemModelImpl _$$OnBoardingItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OnBoardingItemModelImpl(
      title: json['title'] as String? ?? '',
      contents: json['contents'] as String? ?? '',
      imgPath: json['imgPath'] as String? ?? '',
    );

Map<String, dynamic> _$$OnBoardingItemModelImplToJson(
        _$OnBoardingItemModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contents': instance.contents,
      'imgPath': instance.imgPath,
    };
