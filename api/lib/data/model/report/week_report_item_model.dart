import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_report_item_model.g.dart';
part 'week_report_item_model.freezed.dart';

@freezed
class WeekReportItemModel with _$WeekReportItemModel{
  const factory WeekReportItemModel({
    @Default(0) int week,
    @Default(0) int rate
  }) = _WeekReportItemModel;
  const WeekReportItemModel._();
  factory WeekReportItemModel.fromJson(Map<String, dynamic> json) => _$WeekReportItemModelFromJson(json);
}