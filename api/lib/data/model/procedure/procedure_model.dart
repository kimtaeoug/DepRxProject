import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure_model.g.dart';

part 'procedure_model.freezed.dart';

@freezed
class ProcedureModel with _$ProcedureModel {
  const factory ProcedureModel(
      {@Default('') String accessToken,
      @Default('') String name,
      @Default(1) int round,
      @Default(0) int week,
      @Default('') String sequence}) = _ProcedureModel;

  const ProcedureModel._();

  factory ProcedureModel.fromJson(Map<String, dynamic> json) =>
      _$ProcedureModelFromJson(json);
}
