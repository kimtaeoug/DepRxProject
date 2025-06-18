import 'package:freezed_annotation/freezed_annotation.dart';

part 'daum_postcode_model.g.dart';

part 'daum_postcode_model.freezed.dart';

@freezed
class DaumPostcodeModel with _$DaumPostcodeModel {
  const factory DaumPostcodeModel({
    @Default('') String zonecode,
    @Default('') String address,
    @Default('') String addressEnglish,
    @Default('') String addressType,
    @Default('') String bcode,
    @Default('') String bname,
    @Default('') String bname1,
    @Default('') String bname2,
    @Default('') String sido,
    @Default('') String sigungu,
    @Default('') String sigunguCode,
    @Default('') String userLanguageType,
    @Default('') String query,
    @Default('') String buildingName,
    @Default('') String buildingCode,
    @Default('') String apartment,
    @Default('') String jibunAddress,
    @Default('') String jibunAddressEnglish,
    @Default('') String roadAddress,
    @Default('') String roadAddressEnglish,
    @Default('') String autoRoadAddress,
    @Default('') String autoRoadAddressEnglish,
    @Default('') String autoJibunAddress,
    @Default('') String autoJibunAddressEnglish,
    @Default('') String userSelectedType,
    @Default('') String noSelected,
    @Default('') String hname,
    @Default('') String roadnameCode,
    @Default('') String roadname,
  }) = _DaumPostcodeModel;

  factory DaumPostcodeModel.fromJson(Map<String, dynamic> json) =>
      _$DaumPostcodeModelFromJson(json);
}
