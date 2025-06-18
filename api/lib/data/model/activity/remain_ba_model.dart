import 'package:freezed_annotation/freezed_annotation.dart';

part 'remain_ba_model.g.dart';
part 'remain_ba_model.freezed.dart';
@freezed
class RemainBAModel with _$RemainBAModel{
  const factory RemainBAModel({
    @Default([]) List<String> remainActivity
  }) = _RemainBAModel;
  const RemainBAModel._();
  factory RemainBAModel.fromJson(Map<String, dynamic> json) => _$RemainBAModelFromJson(json);
}