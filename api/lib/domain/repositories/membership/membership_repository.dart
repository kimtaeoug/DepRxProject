

import '../../entities/membership/additional_data_entity.dart';
import '../../entities/membership/login_entity.dart';
import '../../entities/membership/reset_pwd_entity.dart';
import '../../entities/membership/sign_up_entity.dart';
import '../../entities/membership/social_login_entity.dart';
import '../../entities/membership/social_signup_entity.dart';

///
/// 회원 관련 Repository
///
abstract class MembershipRepository {
  //회원가입
  Future signUp(SignUpEntity data);

  //회원 추가 데이터 입력 API
  Future addAdditionalData(AdditionalDataEntity data);

  //로그아웃
  Future logout();

  //로그인
  Future login(LoginEntity data);

  //비밀번호 확인
  Future checkPassword(String password);

  //비밀번호 재설정
  Future resetPassword(ResetPwdEntity data);

  //id 중복 확인
  Future checkDuplicateId(String id);

  //환자 코드 인증
  Future checkPatientCode(String code);

  //회원 탈퇴
  Future leave();

  //휴대폰 인증
  Future certPhone(String phoneNumber, {bool checkDuplicate = false});
  //휴대폰 인증 확인
  Future confirmCertPhone(String certificationNumber, String phoneNumber);

  ///
  /// 아이디 찾기
  ///
  Future findId(String phoneNumber);


  ///
  /// 비밀번호 찾기
  ///
  Future checkIdExistingInFindPwd(String id);
  Future findPwd(String newPwd, String confirmPwd, String id);


  ///
  /// 소셜 회원가입
  ///
  Future signUpUsingSocial(SocialSignupEntity data);

  ///
  /// 소셜 로그인
  ///
  Future loginUsingSocial(SocialLoginEntity data);

  ///
  /// ga
  ///
  Future ga();
  ///
  /// 휴면계정 해제
  ///
  Future restoreMember(String phoneNumber);
}
