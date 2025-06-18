import 'package:freezed_annotation/freezed_annotation.dart';

part 'bdi_result_model.g.dart';
part 'bdi_result_model.freezed.dart';

@freezed
class BDIResultModel with _$BDIResultModel{
  const factory BDIResultModel({
    @Default(0) int bdiResult
  }) = _BDIResultModel;
  const BDIResultModel._();
  factory BDIResultModel.fromJson(Map<String, dynamic> json) => _$BDIResultModelFromJson(json);
}