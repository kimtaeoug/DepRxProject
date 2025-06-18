import 'package:freezed_annotation/freezed_annotation.dart';

part 'ba_do_model.g.dart';
part 'ba_do_model.freezed.dart';

@freezed
class BADoModel with _$BADoModel{
  const factory BADoModel({
    @Default('') String activityId,
    @Default('') String imagePath,
    @Default('') String category,
    @Default('') String title,
    @Default('') String description,
    @Default('') String subtitle
  }) = _BADoModel;
  const BADoModel._();
  factory BADoModel.fromJson(Map<String, dynamic> json) => _$BADoModelFromJson(json);
}