import 'package:freezed_annotation/freezed_annotation.dart';

part 'kbads_grade_model.g.dart';

part 'kbads_grade_model.freezed.dart';

@freezed
class KbadsGradeModel with _$KbadsGradeModel {
  const factory KbadsGradeModel(
      {@Default(-1) int min,
      @Default(-1) int max,
      @Default('') String represent,
      @Default([]) List<String> decrease,
      @Default([]) List<String> same,
      @Default([]) List<String> increase}) = _KbadsGradeModel;

  const KbadsGradeModel._();

  factory KbadsGradeModel.fromJson(Map<String, dynamic> json) =>
      _$KbadsGradeModelFromJson(json);
}
