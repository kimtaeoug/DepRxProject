import 'package:freezed_annotation/freezed_annotation.dart';

import 'ranking_item_model.dart';


part 'ranking_model.g.dart';

part 'ranking_model.freezed.dart';

@freezed
class RankingModel with _$RankingModel {
  const factory RankingModel(
      {@Default([]) List<RankingItemModel> rankingList,
      @Default(false) bool isPreferred,
      @Default(false) bool isWorse}) = _RankingModel;

  const RankingModel._();

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);
}
