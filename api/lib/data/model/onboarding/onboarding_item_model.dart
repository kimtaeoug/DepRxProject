import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_item_model.g.dart';
part 'onboarding_item_model.freezed.dart';

@freezed
class OnBoardingItemModel with _$OnBoardingItemModel{
  const factory OnBoardingItemModel({
    @Default('') String title,
    @Default('') String contents,
    @Default('') String imgPath
  }) = _OnBoardingItemModel;
  const OnBoardingItemModel._();
  factory OnBoardingItemModel.fromJson(Map<String, dynamic> json) => _$OnBoardingItemModelFromJson(json);
}