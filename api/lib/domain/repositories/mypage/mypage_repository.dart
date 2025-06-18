///
/// MyPage 관련 Repository
///
abstract class MyPageRepository {
  //마케팅 value
  Future getMyPageMarketing();

  //마케팅 수신 동의
  Future changeMyPageMarketing(bool marketing);

  //알람 설정 변경
  Future changeAlarm(List<List<bool>> alarmList);

  //마이페이지 주간 보상 리스트
  Future getMyPageReward();

  //알람 시간
  Future getMyPageAlarm();

  //알람 수신 여부
  Future getSysAlarm();
  //알람 수신 변경
  Future changeSysAlarm(bool value);
}
