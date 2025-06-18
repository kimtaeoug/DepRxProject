import '../../../api_core/endpoint_type.dart';

import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// Report 관련 API
///
class ReportAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  ReportAPI({required this.endPointType, required this.inputData});

  ReportAPI._({required this.endPointType, required this.inputData});

  ///
  /// 주간 리포트
  ///
  ReportAPI.weekReport(dynamic inputData)
      : this._(endPointType: EndPointType.weekReport, inputData: inputData);

  ///
  /// 회차 리포트
  ///
  ReportAPI.roundReport(dynamic inputData)
      : this._(endPointType: EndPointType.roundReport, inputData: inputData);

  ///
  /// 리포트 확인
  ///
  ReportAPI.checkReport(dynamic inputData) : this._(endPointType: EndPointType.checkReport, inputData: inputData);
  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;

}
