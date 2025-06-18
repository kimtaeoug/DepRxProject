// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ba_recommended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BARecommendedModelImpl _$$BARecommendedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BARecommendedModelImpl(
      actionList: (json['actionList'] as List<dynamic>?)
              ?.map((e) =>
                  ActivitySelectItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BARecommendedModelImplToJson(
        _$BARecommendedModelImpl instance) =>
    <String, dynamic>{
      'actionList': instance.actionList,
    };
