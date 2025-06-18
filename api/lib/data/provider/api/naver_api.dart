import 'package:api/api.dart';

class NaverAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  NaverAPI({required this.endPointType, required this.inputData});

  NaverAPI._({required this.endPointType, required this.inputData});

  NaverAPI.login(dynamic inputData)
      : this._(endPointType: EndPointType.naverLogin, inputData: inputData);

  @override
  get data => inputData;

  @override
  String? get ownServer => 'naver';

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;
}
