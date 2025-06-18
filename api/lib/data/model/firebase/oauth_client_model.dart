import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_client_model.g.dart';
part 'oauth_client_model.freezed.dart';

@freezed
class OauthClientModel with _$OauthClientModel{
  const factory OauthClientModel({
    @Default('') String client_id,
    @Default(0) int client_type,
    @Default(null) dynamic android_info
  }) = _OauthClientModel;
  const OauthClientModel._();
  factory OauthClientModel.fromJson(Map<String, dynamic> json) => _$OauthClientModelFromJson(json);
}
