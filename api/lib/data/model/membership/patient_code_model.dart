import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_code_model.g.dart';
part 'patient_code_model.freezed.dart';

@freezed
class PatientCodeModel with _$PatientCodeModel{
  const factory PatientCodeModel({
    @Default('') String   hospitalName
  }) = _PatientCodeModel;
  const PatientCodeModel._();
  factory PatientCodeModel.fromJson(Map<String, dynamic> json) => _$PatientCodeModelFromJson(json);
}