import 'package:freezed_annotation/freezed_annotation.dart';

part 'ba_model.g.dart';
part 'ba_model.freezed.dart';

@freezed
class BAModel with _$BAModel{
  const factory BAModel({
    @Default('') String date,
    @Default('') String imagePath,
    @Default('') String contents,
    @Default(false) bool done,
    @Default('') String category,
    @Default('') String activityId
  }) = _BAModel;
  const BAModel._();
  factory BAModel.fromJson(Map<String, dynamic> json) => _$BAModelFromJson(json);
}