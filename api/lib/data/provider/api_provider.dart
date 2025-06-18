import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import '../../api_core/http_method.dart';
import '../model/default_response_model.dart';
import 'api_interceptor.dart';
import 'network/api_representable.dart';
import 'package:core/core.dart';
import 'package:encryption/encryption.dart';

///
/// API Provider
/// 모든 API 연결 공급자
///
class APIProvider {
  static final APIProvider instance = APIProvider._();

  APIProvider._();

  factory APIProvider() => instance;

  final AccessTokenUtil accessTokenUtil = AccessTokenUtil();

  final Duration _networkDuration = const Duration(seconds: 30);

  late final Dio _dio = Dio(BaseOptions(
      sendTimeout: _networkDuration,
      connectTimeout: _networkDuration,
      receiveTimeout: _networkDuration));

  final KeyConfiguration _apiKeyUtil = KeyConfiguration();
  final NetworkObserverUtil _networkObserverUtil = NetworkObserverUtil();

  ///
  /// Rest API용 Request
  ///

  Future<DefaultResponseModel> request(APIRequestRepresentable input) async {
    try {
      if(_networkObserverUtil.checkNetwork){
        _dio.interceptors.add(APIInterceptor());
        String endPoint = _apiKeyUtil.endPoint;
        switch (input.type.method) {
          case HttpMethod.get:
            Response response = await _dio.get(
              endPoint + input.type.path,
              queryParameters: input.data,
              options: Options(headers: _header(input.type.needAccessToken)),
            );
            if (input.type.needAccessToken) {
              Headers headers = response.headers;
              String? accessToken = headers.value(ACCESS_TOKEN_KEY);
              if (accessToken != null && accessToken.isNotEmpty) {
                accessTokenUtil.setAccessToken(accessToken);
              }
            }
            dynamic data = response.data;
            Log.d(
                'PATH : ${input.type.path}\nDATA : $data\nHEADER : ${response.headers}');
            return convertDataToDefaultResponseModel(data);
          case HttpMethod.post:
            Response response = await _dio.post(
                endPoint + input.type.path,
                data: input.data,
                options: Options(headers: _header(input.type.needAccessToken)));
            if (input.type.needAccessToken) {
              Headers headers = response.headers;
              String? accessToken = headers.value(ACCESS_TOKEN_KEY);
              if (accessToken != null && accessToken.isNotEmpty) {
                accessTokenUtil.setAccessToken(accessToken);
              }
            }
            dynamic data = response.data;
            Log.d(
                'PATH : ${input.type.path}\nDATA : $data\nHEADER : ${response.headers}');
            return convertDataToDefaultResponseModel(data);
          case HttpMethod.patch:
            Response response = await _dio.patch(
                endPoint + input.type.path,
                queryParameters: input.data,
                options: Options(headers: _header(input.type.needAccessToken)));
            if (input.type.needAccessToken) {
              Headers headers = response.headers;
              String? accessToken = headers.value(ACCESS_TOKEN_KEY);
              if (accessToken != null && accessToken.isNotEmpty) {
                accessTokenUtil.setAccessToken(accessToken);
              }
            }
            dynamic data = response.data;
            Log.d(
                'PATH : ${input.type.path}\nDATA : $data\nHEADER : ${response.headers}');
            return convertDataToDefaultResponseModel(data);
        }
      }else{
       throw Exception("Network Connection Closed");
      }
    } catch (e, s) {
      Log.e('Error : $e\nStackTrace : $s');
      return DefaultResponseModel(UNEXPECTED_ERROR_CODE, e.toString(), input);
    }
  }
  String getEndPoint(String? ownServer){
    if(ownServer != null){
      return 'https://nid.naver.com/oauth2.0';
    }else{
      return _apiKeyUtil.endPoint;
    }
  }

  DefaultResponseModel convertDataToDefaultResponseModel(dynamic data) {
    try {
      if (data is DefaultResponseModel) {
        return data;
      } else {
        if (data is String) {
          return DefaultResponseModel.fromJson(json.decode(data));
        }
        return DefaultResponseModel.fromJson(data);
      }
    } catch (e, s) {
      Log.e('Error :$e\nStackTrace: $s');
      Log.e('data : $data');
      return DefaultResponseModel(UNEXPECTED_ERROR_CODE, e.toString(), null);
    }
  }

  Map<String, dynamic> _header(bool needAccessToken) {
    if (needAccessToken) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessTokenUtil.tokenValue}'
      };
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }
}
