import 'package:freezed_annotation/freezed_annotation.dart';

part 'plist_model.g.dart';

part 'plist_model.freezed.dart';

@freezed
class PlistModel with _$PlistModel {
  const factory PlistModel({
    @Default('') String CLIENT_ID,
    @Default('') String REVERSED_CLIENT_ID,
    @Default('') String ANDROID_CLIENT_ID,
    @Default('') String API_KEY,
    @Default('') String GCM_SENDER_ID,
    @Default('') String PLIST_VERSION,
    @Default('') String BUNDLE_ID,
    @Default('') String PROJECT_ID,
    @Default('') String STORAGE_BUCKET,
    @Default('') String IS_ADS_ENABLED,
    @Default('') String IS_ANALYTICS_ENABLED,
    @Default('') String IS_APPINVITE_ENABLED,
    @Default('') String IS_GCM_ENABLED,
    @Default('') String IS_SIGNIN_ENABLED,
    @Default('') String GOOGLE_APP_ID,
  }) = _PlistModel;

  const PlistModel._();

  factory PlistModel.fromJson(Map<String, dynamic> json) =>
      _$PlistModelFromJson(json);
}
