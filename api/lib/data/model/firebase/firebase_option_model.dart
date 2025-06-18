
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fb_client_model.dart';
import 'fb_project_info_model.dart';

part 'firebase_option_model.g.dart';

part 'firebase_option_model.freezed.dart';

@freezed
class FirebaseOptionModel with _$FirebaseOptionModel {
  const factory FirebaseOptionModel(
      {@Default(FBProjectInfoModel()) FBProjectInfoModel project_info,
      @Default([]) List<FBClientModel> client,
      @Default('') String configuration_version}) = _FirebaseOptionModel;

  const FirebaseOptionModel._();

  factory FirebaseOptionModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseOptionModelFromJson(json);
}
