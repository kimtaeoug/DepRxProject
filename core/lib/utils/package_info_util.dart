import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

///
/// Package Info Util
///
class PackageInfoUtil{
  static final PackageInfoUtil _instance = PackageInfoUtil._();
  PackageInfoUtil._(){
    initPackageInfo();
  }
  factory PackageInfoUtil() => _instance;

  final ValueNotifier<String> _appName = ValueNotifier('');
  final ValueNotifier<String> _packageName = ValueNotifier('');
  final ValueNotifier<String> _version = ValueNotifier('');
  final ValueNotifier<String> _buildNumber = ValueNotifier('');

  String get appName => _appName.value;
  String get packageName => _packageName.value;
  String get versionName => _version.value;
  String get buildNumber => _buildNumber.value;

  PackageInfo? _packageInfo;
  void initPackageInfo()async{
    _packageInfo = await PackageInfo.fromPlatform();
    _appName.value = _packageInfo?.appName ?? '';
    _packageName.value = _packageInfo?.packageName ?? '';
    _version.value = _packageInfo?.version ?? '';
    _buildNumber.value = _packageInfo?.buildNumber ?? '';
  }
}