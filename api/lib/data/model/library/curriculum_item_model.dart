import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_item_model.g.dart';

part 'curriculum_item_model.freezed.dart';

@freezed
class CurriculumItemModel with _$CurriculumItemModel {
  const factory CurriculumItemModel({
    @Default(0) int idx,
    @Default('') String weeklyTitle,
    @Default('') String goal,
    @Default([]) List<String> detail,
  }) = _CurriculumItemModel;

  const CurriculumItemModel._();

  factory CurriculumItemModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumItemModelFromJson(json);
}
