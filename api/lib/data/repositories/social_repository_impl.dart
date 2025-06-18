import 'package:api/data/provider/api/naver_api.dart';
import 'package:api/domain/repositories/social/social_repository.dart';

///
/// Repository with Social
///
class SocialRepositoryImpl extends SocialRepository{
  @override
  Future naverLogin(String clientId, String redirectUri, String state) async{
    return await NaverAPI.login({
      'response_type' : 'code',
      'client_id' : clientId,
      'redirect_uri' : redirectUri,
      'state' : state
    }).request();
  }
}