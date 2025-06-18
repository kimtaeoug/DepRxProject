///
///
///
enum NetworkTag { endpoint, statusCode, method, apiVersion }

extension NetworkTagExtension on NetworkTag {
  String get key => name;

  static Map<String, dynamic> tagData(
      String endPoint, String statusCode, String method, String apiVersion) {
    return {
      NetworkTag.endpoint.key: endPoint,
      NetworkTag.statusCode.key: statusCode,
      NetworkTag.method.key: method,
      NetworkTag.apiVersion.key: apiVersion
    };
  }
}
