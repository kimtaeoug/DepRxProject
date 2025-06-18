import 'package:freezed_annotation/freezed_annotation.dart';

part 'fb_project_info_model.g.dart';

part 'fb_project_info_model.freezed.dart';

@freezed
class FBProjectInfoModel with _$FBProjectInfoModel {
  const factory FBProjectInfoModel(
      {@Default('') String project_number,
      @Default('') String project_id,
      @Default('') String storage_bucket}) = _FBProjectInfoModel;

  const FBProjectInfoModel._();

  factory FBProjectInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FBProjectInfoModelFromJson(json);
}