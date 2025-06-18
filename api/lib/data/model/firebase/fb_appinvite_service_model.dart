import 'package:freezed_annotation/freezed_annotation.dart';

part 'fb_appinvite_service_model.g.dart';

part 'fb_appinvite_service_model.freezed.dart';

@freezed
class FBAppinviteServiceModel with _$FBAppinviteServiceModel {
  const factory FBAppinviteServiceModel(
          {@Default([]) List<String> other_platform_oauth_client}) =
      _FBAppinviteServiceModel;

  const FBAppinviteServiceModel._();

  factory FBAppinviteServiceModel.fromJson(Map<String, dynamic> json) =>
      _$FBAppinviteServiceModelFromJson(json);
}
