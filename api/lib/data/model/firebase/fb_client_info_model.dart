import 'package:freezed_annotation/freezed_annotation.dart';

import 'fb_android_client_info_model.dart';

part 'fb_client_info_model.g.dart';

part 'fb_client_info_model.freezed.dart';

@freezed
class FBClientInfoModel with _$FBClientInfoModel {
  const factory FBClientInfoModel(
      {@Default('') String mobilesdk_app_id,
      @Default(FBAndroidClientInfoModel())
      FBAndroidClientInfoModel android_client_info}) = _FBClientInfoModel;

  const FBClientInfoModel._();

  factory FBClientInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FBClientInfoModelFromJson(json);
}
