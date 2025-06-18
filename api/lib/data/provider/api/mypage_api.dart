
import '../../../api_core/endpoint_type.dart';
import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// MyPage 관련 API
///
class MyPageAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  MyPageAPI({required this.endPointType, required this.inputData});

  MyPageAPI._({required this.endPointType, required this.inputData});

  ///
  /// 마케팅 동의 수정
  ///
  MyPageAPI.changeMyPageMarketing(dynamic inputData)
      : this._(
            endPointType: EndPointType.changeMyPageMarketing,
            inputData: inputData);
  ///
  /// 마케팅 값 가져오기
  ///
  MyPageAPI.getMarketing(dynamic inputData) : this._(endPointType: EndPointType.getMyPageMarketing, inputData: inputData);
  ///
  /// 알람 시간 재설정
  ///
  MyPageAPI.resetMyPageAlarm(dynamic inputData)
      : this._(
            endPointType: EndPointType.resetMyPageAlarm, inputData: inputData);

  ///
  /// 마이페이지 주간 보상 리스트
  ///
  MyPageAPI.getMyPageReward(dynamic inputData)
      : this._(
            endPointType: EndPointType.getMyPageReward, inputData: inputData);

  ///
  /// 마이페이지 알람
  ///
  MyPageAPI.getMyPageAlarm(dynamic inputData) : this._(endPointType: EndPointType.getMyPageAlarm, inputData: inputData);

  ///
  /// 알람 수신 여부
  ///
  MyPageAPI.getSysAlarm() : this._(endPointType: EndPointType.getSysAlarm, inputData: null);
  ///
  /// 알람 수신 변경
  ///
  MyPageAPI.changeSysAlarm(dynamic inputData) : this._(endPointType: EndPointType.changeSysAlarm, inputData: inputData);
  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;

}
