import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_last_model.g.dart';

part 'edu_last_model.freezed.dart';

@freezed
class EduLastModel with _$EduLastModel {
  const factory EduLastModel({@Default([]) List<int> remainEducationList}) =
      _EduLastModel;

  const EduLastModel._();

  factory EduLastModel.fromJson(Map<String, dynamic> json) =>
      _$EduLastModelFromJson(json);
}
