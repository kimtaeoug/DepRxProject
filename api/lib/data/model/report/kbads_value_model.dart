import 'package:freezed_annotation/freezed_annotation.dart';

import 'kbads_detail_model.dart';

part 'kbads_value_model.g.dart';
part 'kbads_value_model.freezed.dart';

@freezed
class KBADSValueModel with _$KBADSValueModel{
  const factory KBADSValueModel({
    @Default(KBADSDetailModel()) KBADSDetailModel activation,
    @Default(KBADSDetailModel()) KBADSDetailModel aae,
    @Default(KBADSDetailModel()) KBADSDetailModel jaal,
    @Default(KBADSDetailModel()) KBADSDetailModel sl
  }) = _KBADSValueModel;
  const KBADSValueModel._();
  factory KBADSValueModel.fromJson(Map<String, dynamic> json) => _$KBADSValueModelFromJson(json);
}