// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_select_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivitySelectItemModelImpl _$$ActivitySelectItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivitySelectItemModelImpl(
      weekOfDay: json['weekOfDay'] as String? ?? '',
      date: json['date'] as String? ?? '',
      baList: (json['baList'] as List<dynamic>?)
              ?.map((e) => BAModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ActivitySelectItemModelImplToJson(
        _$ActivitySelectItemModelImpl instance) =>
    <String, dynamic>{
      'weekOfDay': instance.weekOfDay,
      'date': instance.date,
      'baList': instance.baList,
    };
