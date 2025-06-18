import 'package:freezed_annotation/freezed_annotation.dart';

import 'curriculum_item_model.dart';

part 'curriculum_model.g.dart';

part 'curriculum_model.freezed.dart';

@freezed
class CurriculumModel with _$CurriculumModel {
  const factory CurriculumModel(List<CurriculumItemModel> list) =
      _CurriculumModel;

  const CurriculumModel._();

  factory CurriculumModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModelFromJson(json);
}
