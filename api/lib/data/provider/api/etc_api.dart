import '../../../api_core/endpoint_type.dart';
import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// 기타 API
///
class ETCAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  ETCAPI({required this.endPointType, required this.inputData});

  ETCAPI._({required this.endPointType, required this.inputData});

  ///
  /// 출석
  ///
  ETCAPI.attendance(dynamic inputData)
      : this._(endPointType: EndPointType.attendance, inputData: inputData);

  ///
  /// 오늘 감정
  ///
  ETCAPI.todayEmotion(dynamic inputData)
      : this._(endPointType: EndPointType.todayEmotion, inputData: inputData);

  ///
  /// K-BADS
  ///
  ETCAPI.kBADS(dynamic inputData)
      : this._(endPointType: EndPointType.kBADS, inputData: inputData);

  ///
  /// SDUI
  ///
  ETCAPI.sdui(dynamic inputData)
      : this._(endPointType: EndPointType.SDUI, inputData: inputData);

  ///
  /// 교육
  ///
  ETCAPI.education(dynamic inputData)
      : this._(endPointType: EndPointType.education, inputData: inputData);

  ///
  /// 남은 교육 리스트 가져오기
  ///
  ETCAPI.getLastEdu(dynamic inputData)
      : this._(endPointType: EndPointType.lastEducation, inputData: inputData);

  ///
  /// 절차
  ///
  ETCAPI.procedure(dynamic inputData)
      : this._(endPointType: EndPointType.procedure, inputData: inputData);

  ///
  /// 랭킹
  ///
  ETCAPI.ranking(dynamic inputData)
      : this._(endPointType: EndPointType.ranking, inputData: inputData);

  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;

}
