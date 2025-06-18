import 'package:freezed_annotation/freezed_annotation.dart';

part 'rm_model.g.dart';

part 'rm_model.freezed.dart';

@freezed
class RmModel with _$RmModel {
  const factory RmModel(
      {@Default('') String date,
      @Default([]) List<String> answerList}) = _RmModel;

  const RmModel._();

  factory RmModel.fromJson(Map<String, dynamic> json) =>
      _$RmModelFromJson(json);
}
