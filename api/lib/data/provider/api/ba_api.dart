import '../../../api_core/endpoint_type.dart';
import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// BA 관련 API
///
class BAAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  BAAPI({required this.endPointType, required this.inputData});

  BAAPI._({required this.endPointType, required this.inputData});

  ///
  /// 선택 BA 저장
  ///
  BAAPI.selectedBA(dynamic inputData)
      : this._(endPointType: EndPointType.selectedBA, inputData: inputData);

  ///
  /// 일간 진행할 행동 리스트 가져오기
  ///
  BAAPI.getTodayBAList(dynamic inputData)
      : this._(endPointType: EndPointType.getTodayBAList, inputData: inputData);

  ///
  /// BA 진행 정보 저장하기
  ///
  BAAPI.saveBA(dynamic inputData)
      : this._(endPointType: EndPointType.saveBA, inputData: inputData);

  ///
  /// 추천 BA 리스트 가져오기
  ///
  BAAPI.getRecommendedBAList(dynamic inputData)
      : this._(endPointType: EndPointType.getRecommendedBAList, inputData: inputData);

  ///
  /// 한달간 진행할 행동 리스트 가져오기
  ///
  BAAPI.getMonthBAList(dynamic inputData)
      : this._(endPointType: EndPointType.getMonthBAList, inputData: inputData);


  ///
  /// 프로그램 첫날, 마지막날 가져오기
  ///
  BAAPI.getProgramInfo(dynamic inputData) : this._(endPointType: EndPointType.getProgramInfo, inputData: inputData);

  //getBAInfo
  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;
}
