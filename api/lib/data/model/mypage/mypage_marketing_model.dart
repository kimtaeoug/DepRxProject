import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_marketing_model.g.dart';
part 'mypage_marketing_model.freezed.dart';

@freezed
class MyPageMarketingModel with _$MyPageMarketingModel{
  const factory MyPageMarketingModel({
    @Default(false) bool marketing
  }) = _MyPageMarketingModel;
  const MyPageMarketingModel._();
  factory MyPageMarketingModel.fromJson(Map<String, dynamic> json) => _$MyPageMarketingModelFromJson(json);
}