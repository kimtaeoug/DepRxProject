import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_alarm_model.g.dart';
part 'mypage_alarm_model.freezed.dart';

@freezed
class MyPageAlarmModel with _$MyPageAlarmModel{
  const factory MyPageAlarmModel({
    @Default([]) List<List<bool>> availableTimes
  }) = _MyPageAlarmModel;
  const MyPageAlarmModel._();
  factory MyPageAlarmModel.fromJson(Map<String, dynamic> json) => _$MyPageAlarmModelFromJson(json);
}