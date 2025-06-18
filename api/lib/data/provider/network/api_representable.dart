
import '../../../api_core/endpoint_type.dart';

///
/// provider가 상속받을 class
///
abstract class APIRequestRepresentable {
  EndPointType get type;
  dynamic get data;
  Future request();
  String? get ownServer;
}
