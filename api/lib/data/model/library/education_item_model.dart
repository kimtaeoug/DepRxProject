import 'package:freezed_annotation/freezed_annotation.dart';

import 'education_desc_item_model.dart';

part 'education_item_model.g.dart';

part 'education_item_model.freezed.dart';

@freezed
class EducationItemModel with _$EducationItemModel {
  const factory EducationItemModel(
      {@Default(0) int week,
      @Default('') String title,
      @Default('') String videoPath,
      @Default([]) List<EducationDescItemModel> description,
      @Default('') String thumbNailPath,
      @Default('') String time}) = _EducationItemModel;

  const EducationItemModel._();

  factory EducationItemModel.fromJson(Map<String, dynamic> json) =>
      _$EducationItemModelFromJson(json);
}
