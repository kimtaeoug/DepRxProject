import '../../../api_core/endpoint_type.dart';
import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// BDI 관련 API
///
class BDIAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  BDIAPI({required this.endPointType, required this.inputData});

  BDIAPI._({required this.endPointType, required this.inputData});

  ///
  /// BDI 자동 입력 완료 API
  ///
  BDIAPI.autoComplete(dynamic inputData)
      : this._(
            endPointType: EndPointType.bdiAutoComplete, inputData: inputData);

  ///
  /// BDI 저장 API
  ///
  BDIAPI.save(dynamic inputData)
      : this._(endPointType: EndPointType.saveBA, inputData: inputData);

  ///
  /// BDI 자동 입력 대기 API
  ///
  BDIAPI.wait(dynamic inputData)
      : this._(endPointType: EndPointType.bdiWait, inputData: inputData);

  ///
  /// BDI 결과 API
  ///
  BDIAPI.result(dynamic inputData)
      : this._(endPointType: EndPointType.bdiResult, inputData: inputData);

  ///
  /// 프로그램 시작
  ///
  BDIAPI.startProgram(dynamic inputData) : this._(endPointType: EndPointType.startProgram, inputData: inputData);

  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;
  @override
  String? get ownServer => null;

}
