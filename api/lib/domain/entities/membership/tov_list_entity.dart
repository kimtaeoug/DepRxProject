import 'package:freezed_annotation/freezed_annotation.dart';

part 'tov_list_entity.g.dart';
part 'tov_list_entity.freezed.dart';

@freezed
class TOVListEntity with _$TOVListEntity{
  const factory TOVListEntity({
    @Default('') String keyword,
    @Default([]) List data
  }) = _TOVListEntity;
  const TOVListEntity._();
  factory TOVListEntity.fromJson(Map<String, dynamic> json) => _$TOVListEntityFromJson(json);
} 