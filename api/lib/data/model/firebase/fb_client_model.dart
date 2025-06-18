
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fb_api_key_item_model.dart';
import 'fb_client_info_model.dart';
import 'fb_services_model.dart';
import 'oauth_client_model.dart';

part 'fb_client_model.g.dart';

part 'fb_client_model.freezed.dart';

@freezed
class FBClientModel with _$FBClientModel {
  const factory FBClientModel(
          {@Default(FBClientInfoModel()) FBClientInfoModel client_info,
          @Default([]) List<OauthClientModel> oauth_client,
          @Default([]) List<FBAPIKeyItemModel> api_key,
          @Default(FBServicesModel()) FBServicesModel services}) =
      _FBClientModel;

  const FBClientModel._();

  factory FBClientModel.fromJson(Map<String, dynamic> json) =>
      _$FBClientModelFromJson(json);
}
