import 'package:freezed_annotation/freezed_annotation.dart';
part 'term_model.g.dart';
part 'term_model.freezed.dart';

@freezed
class TermModel with _$TermModel{
  const factory TermModel({
    @Default('') String title,
    @Default('') String contents
  }) = _TermModel;
  const TermModel._();
  factory TermModel.fromJson(Map<String, dynamic> json) => _$TermModelFromJson(json);
}