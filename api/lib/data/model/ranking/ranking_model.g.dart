// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingModelImpl _$$RankingModelImplFromJson(Map<String, dynamic> json) =>
    _$RankingModelImpl(
      rankingList: (json['rankingList'] as List<dynamic>?)
              ?.map((e) => RankingItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isPreferred: json['isPreferred'] as bool? ?? false,
      isWorse: json['isWorse'] as bool? ?? false,
    );

Map<String, dynamic> _$$RankingModelImplToJson(_$RankingModelImpl instance) =>
    <String, dynamic>{
      'rankingList': instance.rankingList,
      'isPreferred': instance.isPreferred,
      'isWorse': instance.isWorse,
    };
