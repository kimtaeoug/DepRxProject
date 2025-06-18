// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_ba_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectedBAEntityImpl _$$SelectedBAEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedBAEntityImpl(
      baList: (json['baList'] as List<dynamic>?)
              ?.map((e) =>
                  SelectedBAItemEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SelectedBAEntityImplToJson(
        _$SelectedBAEntityImpl instance) =>
    <String, dynamic>{
      'baList': instance.baList,
    };
