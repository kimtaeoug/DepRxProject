import 'package:freezed_annotation/freezed_annotation.dart';

import 'selected_ba_item_entity.dart';

part 'selected_ba_entity.g.dart';

part 'selected_ba_entity.freezed.dart';

@freezed
class SelectedBAEntity with _$SelectedBAEntity {
  const factory SelectedBAEntity(
      {@Default([]) List<SelectedBAItemEntity> baList}) = _SelectedBAEntity;

  const SelectedBAEntity._();

  factory SelectedBAEntity.fromJson(Map<String, dynamic> json) =>
      _$SelectedBAEntityFromJson(json);
}
