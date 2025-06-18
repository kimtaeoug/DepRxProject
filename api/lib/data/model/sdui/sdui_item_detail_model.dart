import 'package:freezed_annotation/freezed_annotation.dart';

part 'sdui_item_detail_model.g.dart';

part 'sdui_item_detail_model.freezed.dart';

@freezed
class SDUIItemDetailModel with _$SDUIItemDetailModel {
  const factory SDUIItemDetailModel({
    @Default('') String title,
    @Default([]) List<String> selection,
    @Default('') String type,
    @Default('') String strongTitle
  }) = _SDUIItemDetailModel;

  const SDUIItemDetailModel._();

  factory SDUIItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SDUIItemDetailModelFromJson(json);
}
