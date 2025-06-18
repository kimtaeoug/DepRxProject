import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_reward_item_model.g.dart';
part 'my_page_reward_item_model.freezed.dart';

@freezed
class MyPageRewardItemModel with _$MyPageRewardItemModel{
  const factory MyPageRewardItemModel({
    @Default('') String imgPath,
    @Default('') String label
  }) = _MyPageRewardItemModel;
  const MyPageRewardItemModel._();
  factory MyPageRewardItemModel.fromJson(Map<String, dynamic> json) => _$MyPageRewardItemModelFromJson(json);
}