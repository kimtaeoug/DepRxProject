import 'package:encryption/key_configuration.dart';
import 'package:encryption/sercure_storage_util.dart';
import 'package:flutter/cupertino.dart';

///
/// AccessToken Util
/// mode : insert and update and select
///
class AccessTokenUtil{
  static final AccessTokenUtil _instance = AccessTokenUtil._();
  AccessTokenUtil._(){
    initAccessToken();
  }
  factory AccessTokenUtil() => _instance;

  final ValueNotifier<String> _token = ValueNotifier('');

  String get tokenValue => _token.value;

  Future<String?> initAccessToken() async {
    if (_token.value == '') {
      String? accessToken =
      await secureStorageUtil.getValue(KeyConfiguration().accessTokenKey);
      _token.value = accessToken ?? '';
      return accessToken;
    } else {
      return _token.value;
    }
  }

  final SecureStorageUtil secureStorageUtil = SecureStorageUtil();

  void setAccessToken(String accessToken) async {
    secureStorageUtil.writeValue(
        KeyConfiguration().accessTokenKey, accessToken);
    _token.value = accessToken;
  }

  void clearAccessToken() async {
    secureStorageUtil.writeValue(KeyConfiguration().accessTokenKey, '');
    _token.value = '';
  }
}