import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_item_model.g.dart';

part 'ranking_item_model.freezed.dart';

@freezed
class RankingItemModel with _$RankingItemModel {
  const factory RankingItemModel(
      {@Default('') String contents,
      @Default(0) int beforeValue,
      @Default(0) int afterValue}) = _RankingItemModel;

  const RankingItemModel._();

  factory RankingItemModel.fromJson(Map<String, dynamic> json) =>
      _$RankingItemModelFromJson(json);
}
