import 'package:freezed_annotation/freezed_annotation.dart';

import 'sdui_item_detail_model.dart';


part 'sdui_item_model.g.dart';

part 'sdui_item_model.freezed.dart';

@freezed
class SDUIItemModel with _$SDUIItemModel {
  const factory SDUIItemModel(
      {@Default(0) int number,
      @Default('') String keyword,
      @Default([]) List<SDUIItemDetailModel> data}) = _SDUIItemModel;

  const SDUIItemModel._();

  factory SDUIItemModel.fromJson(Map<String, dynamic> json) =>
      _$SDUIItemModelFromJson(json);
}
