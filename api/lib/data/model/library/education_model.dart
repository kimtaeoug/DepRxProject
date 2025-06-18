import 'package:freezed_annotation/freezed_annotation.dart';

import 'education_item_model.dart';

part 'education_model.g.dart';
part 'education_model.freezed.dart';

@freezed
class EducationModel with _$EducationModel{
  const factory EducationModel({
    @Default([]) List<EducationItemModel> educationList
  }) = _EducationModel;
  const EducationModel._();
  factory EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);
}