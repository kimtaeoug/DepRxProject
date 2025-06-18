import 'package:core/core.dart';

import '../../domain/entities/membership/additional_data_entity.dart';
import '../../domain/entities/membership/login_entity.dart';
import '../../domain/entities/membership/reset_pwd_entity.dart';
import '../../domain/entities/membership/sign_up_entity.dart';
import '../../domain/entities/membership/social_login_entity.dart';
import '../../domain/entities/membership/social_signup_entity.dart';
import '../../domain/repositories/membership/membership_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/membership_api.dart';

///
/// Repository with Membership
///
class MembershipRepositoryImpl extends MembershipRepository {
  @override
  Future<DefaultResponseModel> addAdditionalData(
      AdditionalDataEntity data) async {
    return await MemberShipAPI.additionalData(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> checkDuplicateId(String id) async {
    return await MemberShipAPI.checkDuplicateId({'id': id}).request();
  }

  @override
  Future<DefaultResponseModel> checkPassword(String password) async {
    return await MemberShipAPI.checkPwd({'password': password}).request();
  }

  @override
  Future<DefaultResponseModel> checkPatientCode(String code) async {
    return await MemberShipAPI.checkPatientCode({'code': code}).request();
  }

  @override
  Future<DefaultResponseModel> leave() async {
    return await MemberShipAPI.signOut(null).request();
  }

  @override
  Future<DefaultResponseModel> login(LoginEntity data) async {
    return await MemberShipAPI.login(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> logout() async {
    return await MemberShipAPI.logout(null).request();
  }

  @override
  Future<DefaultResponseModel> resetPassword(ResetPwdEntity data) async {
    return await MemberShipAPI.resetPWD(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> signUp(SignUpEntity data) async {
    return await MemberShipAPI.signUp(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> certPhone(String phoneNumber, {bool checkDuplicate = false}) async {
    return await MemberShipAPI.certPhone({'phoneNumber': phoneNumber, 'duplicate' : checkDuplicate})
        .request();
  }

  @override
  Future<DefaultResponseModel> confirmCertPhone(
      String certificationNumber, String phoneNumber) async {
    return await MemberShipAPI.confirmCertPhone({
      'certificationNumber': certificationNumber,
      'phoneNumber': phoneNumber
    }).request();
  }

  @override
  Future checkIdExistingInFindPwd(String id) async {
    return await MemberShipAPI.checkExistingIdInFindPwd({'id': id}).request();
  }

  @override
  Future findId(String phoneNumber) async {
    return await MemberShipAPI.findId({'phoneNumber': phoneNumber}).request();
  }

  @override
  Future findPwd(String newPwd, String confirmPwd, String id) async {
    return await MemberShipAPI.findPwd(
            {'newPassword': newPwd, 'newPasswordConfirm': confirmPwd, 'id': id})
        .request();
  }

  @override
  Future loginUsingSocial(SocialLoginEntity data) async {
    return await MemberShipAPI.socialLogin(data).request();
  }

  @override
  Future signUpUsingSocial(SocialSignupEntity data) async {
    return await MemberShipAPI.socialSignUp(data).request();
  }

  @override
  Future ga() async {
    return await MemberShipAPI.ga(null).request();
  }

  @override
  Future restoreMember(String phoneNumber) async {
    return await MemberShipAPI.restore({'phoneNumber' : phoneNumber}).request();
  }
}
