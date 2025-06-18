import 'dart:convert';
import 'package:common/component/common/dp_dialog.dart';
import 'package:core/core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:api/api.dart';
import 'package:get/get.dart';

///
/// Firebase RemoteConfig Handler
///
@pragma('vm:entry-point')
class RemoteConfigHandler {
  static final RemoteConfigHandler _instance = RemoteConfigHandler._();

  RemoteConfigHandler._();

  factory RemoteConfigHandler() => _instance;

  final FirebaseRemoteConfig _config = FirebaseRemoteConfig.instance;

  final ValueNotifier<RemoteConfigModel> _configData =
  ValueNotifier(const RemoteConfigModel());

  RemoteConfigModel get configData => _configData.value;

  Future<bool> getRemoteConfig(String remoteConfigKey,
      Function() forceUpdateFunction) async {
    try {
      await _config.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: Duration(minutes: 1),
          minimumFetchInterval: Duration(minutes: 1)));
      await _config.fetchAndActivate();
      RemoteConfigModel data = RemoteConfigModel.fromJson(
          json.decode(_config.getValue(remoteConfigKey).asString()));
      _configData.value = data;
      initRemoteConfigObserver();
      if (data.updateForce) {
        return await _checkUpdateForceVersion(
            data.version, forceUpdateFunction);
      } else if (data.serverInspectionTime != '') {
        return await _checkServerInspection();
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  //
  //check version
  Future<bool> _checkUpdateForceVersion(String remoteConfigVersion,
      Function() forceUpdateFunction) async {
    SplashUtil.preWord();
    PackageInfoUtil infoUtil = PackageInfoUtil();
    String currentVersion = infoUtil.versionName;
    int result = currentVersion.compareTo(remoteConfigVersion);
    if (result >= 0) {
      return true;
    } else {
      forceUpdateFunction();
      return false;
    }
  }

  Future<bool> _checkServerInspection() async {
    SplashUtil.preWord();
    await Get.offAllNamed(Routes.serverInspectionPage);
    return false;
  }

  void initRemoteConfigObserver() async {
    _config.onConfigUpdated.listen(_listener);
  }

  void _listener(RemoteConfigUpdate event) async {
    await _config.fetchAndActivate();
    RemoteConfigValue raw = await _config.getValue(event.updatedKeys.first);
    RemoteConfigModel data = RemoteConfigModel.fromJson(
        json.decode(raw.asString()));
    _configData.value = data;
    if (data.serverInspectionTime != '') {
      await Get.offAllNamed(Routes.serverInspectionPage);
    } else {
      if (data.updateForce) {
        await _checkUpdateForceVersion(data.version, forceUpdateFunction);
      }
    }
  }

  void forceUpdateFunction() {
    DPDialog().showForceUpdate(() {
      UpdateUtil().immediateUpdate();
    });
  }
}
