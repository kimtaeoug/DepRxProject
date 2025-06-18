import 'package:api/api.dart';
import 'package:api/data/model/social/naver_model.dart';
import 'package:api/domain/repositories/social/social_repository.dart';
import 'package:core/config/constants.dart';

///
/// UseCase with Social
///
class SocialUseCase {
  final SocialRepository _repository;

  SocialUseCase(this._repository);

  Future naverLogin(String clientId, String redirectUri, String state,
      {required Function(NaverModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.naverLogin(clientId, redirectUri, state);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(NaverModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
}
