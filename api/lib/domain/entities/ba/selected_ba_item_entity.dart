import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_ba_item_entity.g.dart';
part 'selected_ba_item_entity.freezed.dart';

@freezed
class SelectedBAItemEntity with _$SelectedBAItemEntity{
  const factory SelectedBAItemEntity({
    @Default('') String date,
    @Default([]) List<String> selectedBa
  }) = _SelectedBAItemEntity;
  const SelectedBAItemEntity._();
  factory SelectedBAItemEntity.fromJson(Map<String, dynamic> json) => _$SelectedBAItemEntityFromJson(json);
}