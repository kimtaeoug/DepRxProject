// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingItemModelImpl _$$RankingItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RankingItemModelImpl(
      contents: json['contents'] as String? ?? '',
      beforeValue: (json['beforeValue'] as num?)?.toInt() ?? 0,
      afterValue: (json['afterValue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RankingItemModelImplToJson(
        _$RankingItemModelImpl instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'beforeValue': instance.beforeValue,
      'afterValue': instance.afterValue,
    };
