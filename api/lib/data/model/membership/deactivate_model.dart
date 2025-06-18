import 'package:freezed_annotation/freezed_annotation.dart';

part 'deactivate_model.g.dart';

part 'deactivate_model.freezed.dart';

@freezed
class DeactivateModel with _$DeactivateModel {
  const factory DeactivateModel({@Default('') String id}) = _DeactivateModel;

  const DeactivateModel._();

  factory DeactivateModel.fromJson(Map<String, dynamic> json) =>
      _$DeactivateModelFromJson(json);
}
