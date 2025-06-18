import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:core/utils/device_info_util.dart';
import 'package:flutter/cupertino.dart';

///
/// Sentry Option
///
class SentryOptionUtil {
  static final SentryOptionUtil _instance = SentryOptionUtil._();

  SentryOptionUtil._() {
    initDefaultSentryOption();
  }

  factory SentryOptionUtil() => _instance;

  final DeviceInfoUtil deviceInfoUtil = DeviceInfoUtil();
  final NetworkObserverUtil networkObserverUtil = NetworkObserverUtil();

  final ValueNotifier<SentryOptionEntity> _option =
      ValueNotifier(SentryOptionEntity());

  SentryOptionEntity get option => _option.value;

  void initDefaultSentryOption() {
    _option.value = SentryOptionEntity(
      release: '',
      os: deviceInfoUtil.android?.version.release ?? '',
      network: networkObserverUtil.networkType,
      apiVersion: '0.0.0',
    );
  }

  //route명으로 서비스 찾기
  SentryOptionEntity checkServiceOfRoute(EndPointType type, String statusCode) {
    return _option.value.copyWith(
        endpoint: type.path,
        method: type.method.name,
        service: type.serviceName,
        statusCode: statusCode);
  }
}
