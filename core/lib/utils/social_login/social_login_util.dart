import 'package:api/api.dart';
import 'package:core/types/membership/social_login_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:encryption/encryption.dart';
import 'package:core/core.dart';

class SocialLoginUtil {
  static final SocialLoginUtil _instance = SocialLoginUtil._();

  SocialLoginUtil._();

  factory SocialLoginUtil() => _instance;

  final ValueNotifier<String> _socialType = ValueNotifier('');
  final ValueNotifier<String> _uuid = ValueNotifier('');

  String get uuid {
    if (_socialType.value == 'GOOGLE' || _socialType.value == 'APPLE') {
      return FirebaseAuth.instance.currentUser?.uid ?? '';
    } else {
      return _uuid.value;
    }
  }

  String get socialType => _socialType.value;

  late GoogleSignIn _googleSignIn;
  final PrefUtil localDataUtil = PrefUtil();
  final KeyConfiguration _configuration = KeyConfiguration();

  void init({bool isSham = false}) {
    _googleSignIn = GoogleSignIn(
      clientId: isSham
          ? '13402534043-voobnphnlgvm04krlb8kpjqsseo089au.apps.googleusercontent.com'
          : '662325643039-kkotkpfq1sjvbh05ur05fkleq4g4b5hb.apps.googleusercontent.com',
    );
  }


  //구글 로그인
  Future<String?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? userData = await _googleSignIn.signIn();
      if (userData != null) {
        final GoogleSignInAuthentication auth = await userData.authentication;
        var credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken, idToken: auth.idToken);
        UserCredential? userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
        _socialType.value = 'GOOGLE';
        return userCredential.user?.uid;
      } else {
        return null;
      }
    } catch (e) {
      //todo
      Log.e('Error : $e');
      return e.toString();
      // return null;
    }
  }

  void googleLogout() async {
    try {
      _socialType.value = '';
      _googleSignIn.signOut();
      localDataUtil.saveLoginType('');
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Log.e('Error : $e');
    }
  }

  ///
  /// Kakao
  ///
  final String _kakaoChannelName = 'KAKAO';
  late final MethodChannel _kakaoChannel = MethodChannel(_kakaoChannelName);

  Future<String?> loginWithKakako(Function() failFunction) async {
    try {
      dynamic data =
      await _kakaoChannel.invokeMethod(SocialLoginType.login.name);
      if (data is Map) {
        KakaoLoginEntity response = KakaoLoginEntity.fromObjectJson(data);
        String uuid = response.userId;
        _socialType.value = _kakaoChannelName;
        _uuid.value = uuid;
        return uuid;
      } else {
        throw Exception("Kakao Response is not Map");
      }
    } catch (e) {
      failFunction.call();
      Log.e('Error : $e');
    }
    return null;
  }

  void logoutInKakao() async {
    try {
      dynamic data =
      await _kakaoChannel.invokeMethod(SocialLoginType.logout.name);
      _socialType.value = '';
      localDataUtil.saveLoginType('');
      Log.e('data : $data');
    } catch (e) {
      Log.e('Error : $e');
    }
  }

  Future<bool> closeConnectionToKakao() async {
    try {
      return await _kakaoChannel
          .invokeMethod(SocialLoginType.closeConnection.name);
    } catch (e) {
      Log.e('Error : $e');
      return false;
    }
  }

  void profileFromKakao() async {
    try {
      dynamic data =
      await _kakaoChannel.invokeMethod(SocialLoginType.profile.name);
      Log.e('data : $data');
    } catch (e) {
      Log.e('Error : $e');
    }
  }

  ///
  /// Naver
  ///
  final String _naverChannelName = 'NAVER';
  late final MethodChannel _naverChannel = MethodChannel(_naverChannelName);

  Future<String?> loginWithNaver(Function() failFunction) async {
    try {
      dynamic data =
      await _naverChannel.invokeMethod(SocialLoginType.login.name);
      if (data is Map) {
        NaverLoginResponseEntity response =
        NaverLoginResponseEntity.fromObjectJson(data);
        if (response.code == '00' || response.message == 'success') {
          String uuid =
              NaverLoginResponseItemEntity
                  .fromRawString(response.response)
                  .id;
          _socialType.value = _naverChannelName;
          _uuid.value = uuid;
          return uuid;
        } else {
          throw Exception("Error Occured in getProfile");
        }
      } else {
        throw Exception("Error Occured in Login");
      }
    } catch (e) {
      failFunction.call();
      Log.e('Error : $e');
    }
    return null;
  }

  void logoutInNaver() async {
    try {
      dynamic data =
      await _naverChannel.invokeMethod(SocialLoginType.logout.name);
      _socialType.value = '';
      localDataUtil.saveLoginType('');
      closeConnectionToNaver();
      Log.e('data : $data');
    } catch (e) {
      Log.e('Error : $e');
    }
  }

  Future<bool> closeConnectionToNaver() async {
    try {
      return await _naverChannel
          .invokeMethod(SocialLoginType.closeConnection.name);
    } catch (e) {
      Log.e('Error : $e');
      return false;
    }
  }

  void profileFromNaver() async {
    try {
      dynamic data =
      await _naverChannel.invokeMethod(SocialLoginType.profile.name);
      Log.e('data : $data');
    } catch (e) {
      Log.e('Error : $e');
    }
  }

  Future<bool> checkNaverExisting() async {
    try {
      bool data = await _naverChannel.invokeMethod(
          "check_app_existing") as bool;
      return data;
    } catch (e) {
      Log.e('Error : $e');
    }
    return false;
  }
}
