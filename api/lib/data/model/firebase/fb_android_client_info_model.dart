import 'package:freezed_annotation/freezed_annotation.dart';

part 'fb_android_client_info_model.g.dart';
part 'fb_android_client_info_model.freezed.dart';

@freezed
class FBAndroidClientInfoModel with _$FBAndroidClientInfoModel{
  const factory FBAndroidClientInfoModel({
    @Default('') String package_name
  }) = _FBAndroidClientInfoModel;
  const FBAndroidClientInfoModel._();
  factory FBAndroidClientInfoModel.fromJson(Map<String, dynamic> json) => _$FBAndroidClientInfoModelFromJson(json);
}
