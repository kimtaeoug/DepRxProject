//allAlarm
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_all_alarm_model.g.dart';

part 'mypage_all_alarm_model.freezed.dart';

@freezed
class MyPageAllAlarmModel with _$MyPageAllAlarmModel {
  const factory MyPageAllAlarmModel({@Default(true) bool allAlarm}) =
      _MyPageAllAlarmModel;

  const MyPageAllAlarmModel._();

  factory MyPageAllAlarmModel.fromJson(Map<String, dynamic> json) =>
      _$MyPageAllAlarmModelFromJson(json);
}
