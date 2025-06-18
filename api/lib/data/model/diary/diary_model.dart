import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_model.g.dart';
part 'diary_model.freezed.dart';

@freezed
class DiaryModel with _$DiaryModel{
  const factory DiaryModel({
    @Default('') String date,
    @Default('') String contents
  }) = _DiaryModel;

  const DiaryModel._();
  factory DiaryModel.fromJson(Map<String, dynamic> json) => _$DiaryModelFromJson(json);
}