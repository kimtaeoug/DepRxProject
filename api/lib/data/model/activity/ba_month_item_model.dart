import 'package:freezed_annotation/freezed_annotation.dart';

import 'ba_model.dart';

part 'ba_month_item_model.g.dart';

part 'ba_month_item_model.freezed.dart';

@freezed
class BAMonthItemModel with _$BAMonthItemModel {
  const factory BAMonthItemModel(
      {@Default(0) int day,
      @Default([]) List<BAModel> baList}) = _BAMonthItemModel;

  const BAMonthItemModel._();

  factory BAMonthItemModel.fromJson(Map<String, dynamic> json) =>
      _$BAMonthItemModelFromJson(json);
}
