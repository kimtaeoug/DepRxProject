import 'package:api/api.dart';

///
/// Sham 관련 API
///
class DiaryAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  DiaryAPI({required this.endPointType, required this.inputData});

  DiaryAPI._({required this.endPointType, required this.inputData});

  DiaryAPI.saveRm(dynamic inputData)
      : this._(endPointType: EndPointType.saveRm, inputData: inputData);

  DiaryAPI.saveTd(dynamic inputData)
      : this._(endPointType: EndPointType.saveTd, inputData: inputData);

  DiaryAPI.saveTed(dynamic inputData)
      : this._(endPointType: EndPointType.saveTed, inputData: inputData);

  DiaryAPI.getRm(dynamic inputData)
      : this._(endPointType: EndPointType.getRm, inputData: inputData);

  DiaryAPI.getTd(dynamic inputData)
      : this._(endPointType: EndPointType.getTd, inputData: inputData);

  DiaryAPI.getTed(dynamic inputData)
      : this._(endPointType: EndPointType.getTed, inputData: inputData);

  DiaryAPI.getProgramInfo(dynamic inputData)
      : this._(endPointType: EndPointType.taskInfo, inputData: inputData);

  DiaryAPI.month(dynamic inputData)
      : this._(endPointType: EndPointType.monthData, inputData: inputData);

  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;

}
