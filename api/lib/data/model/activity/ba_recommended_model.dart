import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_select_item_model.dart';

part 'ba_recommended_model.g.dart';
part 'ba_recommended_model.freezed.dart';

@freezed
class BARecommendedModel with _$BARecommendedModel{
  const factory BARecommendedModel({
    @Default([]) List<ActivitySelectItemModel> actionList
  }) = _BARecommendedModel;
  const BARecommendedModel._();
  factory BARecommendedModel.fromJson(Map<String, dynamic> json) => _$BARecommendedModelFromJson(json);
}