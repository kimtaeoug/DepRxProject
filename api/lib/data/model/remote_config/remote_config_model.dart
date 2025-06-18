import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_model.g.dart';

part 'remote_config_model.freezed.dart';

@freezed
class RemoteConfigModel with _$RemoteConfigModel {
  const factory RemoteConfigModel(
      {@Default('') String serverInspectionTime,
      @Default(false) bool updateForce,
      @Default(false) bool isClinical,
      @Default('') String version}) = _RemoteConfigModel;

  const RemoteConfigModel._();

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigModelFromJson(json);
}
