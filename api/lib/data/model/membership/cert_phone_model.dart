import 'package:freezed_annotation/freezed_annotation.dart';


part 'cert_phone_model.g.dart';
part 'cert_phone_model.freezed.dart';

@freezed
class CertPhoneModel with _$CertPhoneModel{
  const factory CertPhoneModel({
    @Default('') String number,
    @Default('') String expiredTime
  }) = _CertPhoneModel;
  const CertPhoneModel._();
  factory CertPhoneModel.fromJson(Map<String, dynamic> json) => _$CertPhoneModelFromJson(json);
}