import '../../../api_core/endpoint_type.dart';

import '../api_provider.dart';
import '../network/api_representable.dart';

///
/// Reward 관련 API
///
class RewardAPI implements APIRequestRepresentable {
  final EndPointType endPointType;
  final dynamic inputData;

  RewardAPI({required this.endPointType, required this.inputData});

  RewardAPI._({required this.endPointType, required this.inputData});

  ///
  /// 회차 보상 리스트(8주동안 받은 보상 리스트)
  ///
  RewardAPI.roundList(dynamic inputData)
      : this._(endPointType: EndPointType.rewardList, inputData: inputData);

  ///
  /// 주간 보상 선택 저장
  ///
  RewardAPI.saveReward(dynamic inputData)
      : this._(endPointType: EndPointType.rewardSave, inputData: inputData);

  ///
  /// 주간 보상 수령
  ///
  RewardAPI.receiveReward(dynamic inputData)
      : this._(endPointType: EndPointType.rewardReceive, inputData: inputData);

  ///
  /// 주간 보상 리스트
  ///
  RewardAPI.weekList(dynamic inputData)
      : this._(endPointType: EndPointType.rewardWeek, inputData: inputData);

  ///
  /// 전체 보상 리스트
  ///
  RewardAPI.allList(dynamic inputData)
      : this._(endPointType: EndPointType.rewardAll, inputData: inputData);

  ///
  /// 스탬프 보상
  ///
  RewardAPI.stamp(dynamic inputData)
      : this._(endPointType: EndPointType.rewardStamp, inputData: inputData);

  ///
  /// 보상 메인 페이지 회차 보상 리스트
  ///
  RewardAPI.main(dynamic inputData)
      : this._(endPointType: EndPointType.rewardMain, inputData: inputData);

  ///
  /// 최종 보상
  ///
  RewardAPI.finalReward(dynamic inputData)
      : this._(endPointType: EndPointType.rewardFinal, inputData: inputData);

  @override
  get data => inputData;

  @override
  Future request() => APIProvider().request(this);

  @override
  EndPointType get type => endPointType;

  @override
  String? get ownServer => null;

}
