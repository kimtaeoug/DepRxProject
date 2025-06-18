import 'package:freezed_annotation/freezed_annotation.dart';

import 'ba_model.dart';

part 'report_ba_item_model.g.dart';
part 'report_ba_item_model.freezed.dart';

@freezed
class ReportBAItemModel with _$ReportBAItemModel{
  const factory ReportBAItemModel({
    @Default('') String dateLabel,
    @Default([]) List<BAModel> baList
  }) = _ReportBAItemModel;
  const ReportBAItemModel._();
  factory ReportBAItemModel.fromJson(Map<String, dynamic> json) => _$ReportBAItemModelFromJson(json);
}