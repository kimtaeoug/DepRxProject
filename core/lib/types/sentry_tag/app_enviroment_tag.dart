///
///.배포 버전 : release
/// App 버전 : version
/// os 환경 : os
/// 네트워크 환경 : network
///
enum AppEnviromentTag { release, version, os, network }

extension AppEnviromentTagExtension on AppEnviromentTag {
  String get key => name;

  static Map<String, dynamic> tagData(
      String release, String version, String os, String network) {
    return {
      AppEnviromentTag.release.key: release,
      AppEnviromentTag.version.key: version,
      AppEnviromentTag.os.key: os,
      AppEnviromentTag.network.key: network
    };
  }
}
