import 'package:freezed_annotation/freezed_annotation.dart';

part 'sdui_model.g.dart';
part 'sdui_model.freezed.dart';

@freezed
class SDUIModel with _$SDUIModel{
  const factory SDUIModel({
    @Default([]) List<dynamic> sequence
  }) = _SDUIModel;
  const SDUIModel._();
  factory SDUIModel.fromJson(Map<String, dynamic> json) => _$SDUIModelFromJson(json);
}