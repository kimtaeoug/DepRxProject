import '../../../api_core/endpoint_type.dart';
import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// 회원 관련 API
///
class MemberShipAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  MemberShipAPI._({required this.endPointType, required this.inputData});

  ///
  /// 회원가입
  ///
  MemberShipAPI.signUp(dynamic inputData)
      : this._(endPointType: EndPointType.signUp, inputData: inputData);

  ///
  /// 알파데이터
  ///
  MemberShipAPI.additionalData(dynamic inputData)
      : this._(endPointType: EndPointType.signUpAlpha, inputData: inputData);

  ///
  /// 로그아웃
  ///
  MemberShipAPI.logout(dynamic inputData)
      : this._(endPointType: EndPointType.logout, inputData: inputData);

  ///
  /// 로그인
  ///
  MemberShipAPI.login(dynamic inputData)
      : this._(endPointType: EndPointType.login, inputData: inputData);

  ///
  /// 비밀번호 확인
  ///
  MemberShipAPI.checkPwd(dynamic inputData)
      : this._(endPointType: EndPointType.checkPwd, inputData: inputData);

  ///
  /// 비밀번호 재설정
  ///
  MemberShipAPI.resetPWD(dynamic inputData)
      : this._(endPointType: EndPointType.resetPWd, inputData: inputData);

  ///
  /// id 중복 확인
  ///
  MemberShipAPI.checkDuplicateId(dynamic inputData)
      : this._(
            endPointType: EndPointType.checkDuplicateId, inputData: inputData);

  ///
  /// 환자 코드 인증
  ///
  MemberShipAPI.checkPatientCode(dynamic inputData)
      : this._(
            endPointType: EndPointType.checkPatientCode, inputData: inputData);

  ///
  /// 회원 탈퇴
  ///
  MemberShipAPI.signOut(dynamic inputData)
      : this._(endPointType: EndPointType.leave, inputData: inputData);

  ///
  /// 휴대폰 인증
  ///

  MemberShipAPI.certPhone(dynamic inputData)
      : this._(endPointType: EndPointType.certPhone, inputData: inputData);

  ///
  /// 휴대폰 인증 확인
  ///
  MemberShipAPI.confirmCertPhone(dynamic inputData)
      : this._(
            endPointType: EndPointType.certPhoneConfirm, inputData: inputData);

  ///
  /// 아이디 존재 여부
  ///
  MemberShipAPI.checkExistingIdInFindPwd(dynamic inputData)
      : this._(
            endPointType: EndPointType.checkExistingId, inputData: inputData);

  ///
  /// 아이디 찾기
  ///
  MemberShipAPI.findId(dynamic inputData)
      : this._(endPointType: EndPointType.findId, inputData: inputData);

  ///
  /// 비밀번호찾기
  ///
  MemberShipAPI.findPwd(dynamic inputData)
      : this._(endPointType: EndPointType.findPwd, inputData: inputData);

  ///
  /// 소셜 회원가입
  ///
  MemberShipAPI.socialSignUp(dynamic inputData)
      : this._(endPointType: EndPointType.socialSignUp, inputData: inputData);

  ///
  /// 소셜 로그인
  ///
  MemberShipAPI.socialLogin(dynamic inputData)
      : this._(endPointType: EndPointType.socialLogin, inputData: inputData);

  ///
  /// GA
  ///
  MemberShipAPI.ga(dynamic inputData)
      : this._(endPointType: EndPointType.ga, inputData: inputData);

  ///
  /// Restore
  ///
  MemberShipAPI.restore(dynamic inputData)
      : this._(endPointType: EndPointType.restoreMember, inputData: inputData);

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  get data => inputData;

  @override
  String? get ownServer => null;

}
