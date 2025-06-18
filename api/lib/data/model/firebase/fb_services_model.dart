import 'package:freezed_annotation/freezed_annotation.dart';

import 'fb_appinvite_service_model.dart';

part 'fb_services_model.g.dart';

part 'fb_services_model.freezed.dart';

@freezed
class FBServicesModel with _$FBServicesModel {
  const factory FBServicesModel(
      {@Default(FBAppinviteServiceModel())
      FBAppinviteServiceModel services}) = _FBServicesModel;

  const FBServicesModel._();

  factory FBServicesModel.fromJson(Map<String, dynamic> json) =>
      _$FBServicesModelFromJson(json);
}
