import 'package:api/data/model/ga/ga_alpha_data_model.dart';
import 'package:api/data/model/membership/deactivate_model.dart';
import 'package:api/data/model/membership/patient_code_model.dart';
import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/membership/find_id_model.dart';
import '../../data/model/procedure/procedure_model.dart';
import '../entities/membership/additional_data_entity.dart';
import '../entities/membership/login_entity.dart';
import '../entities/membership/reset_pwd_entity.dart';
import '../entities/membership/sign_up_entity.dart';
import '../entities/membership/social_login_entity.dart';
import '../entities/membership/social_signup_entity.dart';
import '../repositories/membership/membership_repository.dart';

///
/// UseCase with Membership
///
class MembershipUseCase {
  final MembershipRepository _repository;

  MembershipUseCase(this._repository);

  Future signUp(SignUpEntity data,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.signUp(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future addAdditionalData(AdditionalDataEntity data) async {
    DefaultResponseModel response = await _repository.addAdditionalData(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        return true;
      } else {
        return response;
      }
    } catch (e) {
      return response;
    }
  }

  Future logout(
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.logout();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future login(LoginEntity data,
      {required Function(ProcedureModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.login(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProcedureModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future checkPwd(String pwd,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.checkPassword(pwd);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future resetPwd(ResetPwdEntity data,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.resetPassword(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future checkDuplicateId(String id,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.checkDuplicateId(id);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future checkPatientCode(String code,
      {required Function(PatientCodeModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.checkPatientCode(code);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(PatientCodeModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future leave(
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.leave();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future certPhone(String phoneNumber,
      {required Function() successFunction,
      required Function(dynamic) failFunction,
      bool checkDuplicate = false}) async {
    DefaultResponseModel response = await _repository.certPhone(phoneNumber,
        checkDuplicate: checkDuplicate);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future confirmCertPhone(String certificationNumber, String phoneNumber,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.confirmCertPhone(certificationNumber, phoneNumber);
    Log.e('response : ${response.toJson()}');
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future checkIdExistingInFindPwd(String id,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.checkIdExistingInFindPwd(id);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future findId(String phoneNumber,
      {required Function(FindIdModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.findId(phoneNumber);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(FindIdModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future findPwd(String newPwd, String confirmPwd, String id,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.findPwd(newPwd, confirmPwd, id);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future socialSignUp(SocialSignupEntity data,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.signUpUsingSocial(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future socialLogin(SocialLoginEntity data,
      {required Function(ProcedureModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.loginUsingSocial(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProcedureModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future ga(
      {required Function(GAAlphaDataModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.ga();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(GAAlphaDataModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future restoreMember(String phoneNumber,
      {required Function(DeactivateModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.restoreMember(phoneNumber);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(DeactivateModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
