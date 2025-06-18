import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_model.g.dart';
part 'license_model.freezed.dart';

@freezed
class LicenseModel with _$LicenseModel{
  const factory LicenseModel({
    @Default('') String title,
    @Default('') String data
  }) = _LicenseModel;
  const LicenseModel._();
  factory LicenseModel.fromJson(Map<String, dynamic> json) => _$LicenseModelFromJson(json);
}