import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_response_model.g.dart';

part 'default_response_model.freezed.dart';

@freezed
class DefaultResponseModel with _$DefaultResponseModel {
  const factory DefaultResponseModel(
          String errorCode, String msg, dynamic data) =
      _DefaultResponseModel;

  const DefaultResponseModel._();

  factory DefaultResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseModelFromJson(json);
}
