import 'package:freezed_annotation/freezed_annotation.dart';

import 'kbads_grade_model.dart';


part 'kbads_item_model.g.dart';

part 'kbads_item_model.freezed.dart';

@freezed
class KbadsItemModel with _$KbadsItemModel {
  const factory KbadsItemModel(
      {@Default(KbadsGradeModel()) KbadsGradeModel grade1,
      @Default(KbadsGradeModel()) KbadsGradeModel grade2,
      @Default(KbadsGradeModel()) KbadsGradeModel grade3,
      @Default(KbadsGradeModel()) KbadsGradeModel grade4}) = _KbadsItemModel;

  const KbadsItemModel._();

  factory KbadsItemModel.fromJson(Map<String, dynamic> json) =>
      _$KbadsItemModelFromJson(json);
}
