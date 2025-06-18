import 'package:freezed_annotation/freezed_annotation.dart';

part 'kbads_detail_model.g.dart';

part 'kbads_detail_model.freezed.dart';

@freezed
class KBADSDetailModel with _$KBADSDetailModel {
  const factory KBADSDetailModel(
      {@Default([]) List<int?> score}) = _KBADSDetailModel;

  const KBADSDetailModel._();

  factory KBADSDetailModel.fromJson(Map<String, dynamic> json) =>
      _$KBADSDetailModelFromJson(json);
}
