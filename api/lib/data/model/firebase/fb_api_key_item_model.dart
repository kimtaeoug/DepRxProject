import 'package:freezed_annotation/freezed_annotation.dart';

part 'fb_api_key_item_model.g.dart';
part 'fb_api_key_item_model.freezed.dart';

@freezed
class FBAPIKeyItemModel with _$FBAPIKeyItemModel{
  const factory FBAPIKeyItemModel({
    @Default('') String current_key
  }) = _FBAPIKeyItemModel;
  const FBAPIKeyItemModel._();
  factory FBAPIKeyItemModel.fromJson(Map<String, dynamic> json) => _$FBAPIKeyItemModelFromJson(json);
}
