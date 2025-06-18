// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ba_month_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BAMonthItemModelImpl _$$BAMonthItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BAMonthItemModelImpl(
      day: (json['day'] as num?)?.toInt() ?? 0,
      baList: (json['baList'] as List<dynamic>?)
              ?.map((e) => BAModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BAMonthItemModelImplToJson(
        _$BAMonthItemModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'baList': instance.baList,
    };
