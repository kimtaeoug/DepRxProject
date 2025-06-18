import 'package:freezed_annotation/freezed_annotation.dart';

part 'kbads_model.g.dart';
part 'kbads_model.freezed.dart';

@freezed
class KBADSListModel with _$KBADSListModel{
  const factory KBADSListModel({
    @Default([]) List<String> list
  }) = _KBADSListModel;
  const KBADSListModel._();
  factory KBADSListModel.fromJson(Map<String, dynamic> json) => _$KBADSListModelFromJson(json);
}