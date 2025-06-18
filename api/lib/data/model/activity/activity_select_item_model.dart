import 'package:freezed_annotation/freezed_annotation.dart';

import 'ba_model.dart';

part 'activity_select_item_model.g.dart';
part 'activity_select_item_model.freezed.dart';

@freezed
class ActivitySelectItemModel with _$ActivitySelectItemModel{
  const factory ActivitySelectItemModel({
    @Default('') String weekOfDay,
    @Default('') String date,
    @Default([]) List<BAModel> baList
  }) = _ActivitySelectItemModel;

  const ActivitySelectItemModel._();
  factory ActivitySelectItemModel.fromJson(Map<String, dynamic> json) => _$ActivitySelectItemModelFromJson(json);

}