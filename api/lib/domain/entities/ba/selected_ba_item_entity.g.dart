// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_ba_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectedBAItemEntityImpl _$$SelectedBAItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedBAItemEntityImpl(
      date: json['date'] as String? ?? '',
      selectedBa: (json['selectedBa'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SelectedBAItemEntityImplToJson(
        _$SelectedBAItemEntityImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'selectedBa': instance.selectedBa,
    };
