
import 'package:freezed_annotation/freezed_annotation.dart';

import '../activity/report_ba_item_model.dart';
import 'kbads_value_model.dart';

part 'report_model.g.dart';

part 'report_model.freezed.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel(
      {@Default(0) int week,
      @Default(0) int achieveRate,
      @Default(KBADSValueModel()) KBADSValueModel kbadsResult,
      @Default([]) List<String> rewardList,
      @Default([]) List<ReportBAItemModel> baList}) = _ReportModel;

  const ReportModel._();

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);
}
