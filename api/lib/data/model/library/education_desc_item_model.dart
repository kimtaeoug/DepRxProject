import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_desc_item_model.g.dart';
part 'education_desc_item_model.freezed.dart';

@freezed
class EducationDescItemModel with _$EducationDescItemModel{
  const factory EducationDescItemModel({
    @Default('') String type,
    @Default('') String title,
    @Default([]) List<String> contents,
    @Default([]) List<String> strong,
    @Default('') String week,
    @Default(1) int img
  }) = _EducationDescItemModel;
  const EducationDescItemModel._();
  factory EducationDescItemModel.fromJson(Map<String, dynamic> json) => _$EducationDescItemModelFromJson(json);
}

