import 'package:freezed_annotation/freezed_annotation.dart';

part 'naver_model.g.dart';

part 'naver_model.freezed.dart';

@freezed
class NaverModel with _$NaverModel {
  const factory NaverModel(
      {@Default('') String code,
      @Default('') String state,
      @Default('') String error,
      @Default('') String error_description}) = _NaverModel;

  const NaverModel._();

  factory NaverModel.fromJson(Map<String, dynamic> json) =>
      _$NaverModelFromJson(json);
}
