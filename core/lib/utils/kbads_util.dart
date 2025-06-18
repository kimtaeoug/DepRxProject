import 'package:flutter/cupertino.dart';
import 'package:api/api.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';
import 'package:core/core.dart';

///
/// K-BADS Description Util
///
class KbadsUtil {
  static final KbadsUtil _instance = KbadsUtil._();

  KbadsUtil._();

  factory KbadsUtil() => _instance;

  final ValueNotifier<Map<KBadsType, KbadsItemModel>> _map = ValueNotifier({});
  final ValueNotifier<bool> loading = ValueNotifier(true);

  //KBadsType
  void initData(JsonService service) async {
    if (_map.value.isEmpty) {
      loading.value = true;
      KbadsModel model = await Resource.kbadsDescriptionData(service);
      //item 할당
      _map.value[KBadsType.ac] = model.activation;
      _map.value[KBadsType.aae] = model.aae;
      _map.value[KBadsType.jaal] = model.jaal;
      _map.value[KBadsType.sl] = model.sl;
      loading.value = false;
    }
  }

  ///
  /// valueList -> 값들
  ///
  String? getDescription(KBadsType type, List<int?> valueList, int week) {
    try {
      if (valueList.isEmpty || valueList
          .where((e) => e != null)
          .isEmpty) {
        return null;
      }
      if (valueList[week-1] == null) {
        return null;
      }
      KbadsItemModel data = _whichData(type);
      //null이 없을 경우
      if (valueList
          .where((e) => e == null)
          .isEmpty) {
        if (week == 1) {
          int? currentValue = valueList.first ?? 0;
          KbadsGradeType type =
          KbadsGradeTypeExtension.whichGrade(data, currentValue);
          return KbadsGradeTypeExtension
              .convert(data, type)
              .represent;
        } else {
          int beforeValue = valueList[week - 2] ?? 0;
          int currentValue = valueList[week - 1] ?? 0;
          Log.e('beforeValue : $beforeValue');
          Log.e('currentValue : $currentValue');
          KbadsGradeType beforeGrade =
          KbadsGradeTypeExtension.whichGrade(data, beforeValue);
          KbadsGradeType currentGrade =
          KbadsGradeTypeExtension.whichGrade(data, currentValue);
          if (beforeGrade == currentGrade) {
            if (beforeValue < currentValue) {
              List<String> increase =
                  KbadsGradeTypeExtension
                      .convert(data, currentGrade)
                      .increase;
              if (week.isEven) {
                return increase.last;
              } else {
                return increase.first;
              }
            } else if (beforeValue == currentValue) {
              //점수가 이전이랑 같을때
              List<String> same =
                  KbadsGradeTypeExtension
                      .convert(data, currentGrade)
                      .same;
              if (week.isEven) {
                return same.last;
              } else {
                return same.first;
              }
            } else {
              List<String> decrease =
                  KbadsGradeTypeExtension
                      .convert(data, currentGrade)
                      .decrease;
              if (week.isEven) {
                return decrease.last;
              } else {
                return decrease.first;
              }
            }
          } else {
            //구간 달라졌을때
            KbadsGradeType type =
            KbadsGradeTypeExtension.whichGrade(data, currentValue);
            return KbadsGradeTypeExtension
                .convert(data, type)
                .represent;
          }
        }
      } else {
        //null이 있을 경우
        List<int> notNullList = getNotNullList(valueList);
        if (notNullList.length == 1) {
          KbadsGradeType type =
          KbadsGradeTypeExtension.whichGrade(data, notNullList.first);
          return KbadsGradeTypeExtension
              .convert(data, type)
              .represent;
        } else {
          Map<int, int?> map = makeMap(valueList);
          int? beforeIdx = findBeforeIdx(map, week);
          if (beforeIdx != null) {
            int currentValue = map[week] ?? 0;
            int beforeValue = map[beforeIdx] ?? 0;
            KbadsGradeType beforeGrade =
            KbadsGradeTypeExtension.whichGrade(data, beforeValue);
            KbadsGradeType currentGrade =
            KbadsGradeTypeExtension.whichGrade(data, currentValue);
            if (beforeGrade == currentGrade) {
              //동일 구간일 때
              if (beforeValue > currentValue) {
                List<String> decrease =
                    KbadsGradeTypeExtension
                        .convert(data, currentGrade)
                        .decrease;
                if (week.isEven) {
                  return decrease.last;
                } else {
                  return decrease.first;
                }
              } else if (beforeValue == currentValue) {
                List<String> same =
                    KbadsGradeTypeExtension
                        .convert(data, currentGrade)
                        .same;
                if (week.isEven) {
                  return same.last;
                } else {
                  return same.first;
                }
              } else {
                List<String> increase =
                    KbadsGradeTypeExtension
                        .convert(data, currentGrade)
                        .increase;
                if (week.isEven) {
                  return increase.last;
                } else {
                  return increase.first;
                }
              }
            } else {
              KbadsGradeType type =
              KbadsGradeTypeExtension.whichGrade(data, currentValue);
              return KbadsGradeTypeExtension
                  .convert(data, type)
                  .represent;
            }
          } else {
            KbadsGradeType type =
            KbadsGradeTypeExtension.whichGrade(data, notNullList.first);
            return KbadsGradeTypeExtension
                .convert(data, type)
                .represent;
          }
        }
      }
    } catch (e) {
      Log.e(e);
      return null;
    }
  }

  KbadsItemModel _whichData(KBadsType type) {
    return _map.value[type] ?? const KbadsItemModel();
  }

  ///
  /// Map
  ///
  Map<int, int?> makeMap(List<int?> input) {
    Map<int, int?> result = {};
    for (int idx = 0; idx < input.length; idx++) {
      result[idx + 1] = input[idx];
    }
    return result;
  }

  ///
  /// beforeidx
  ///
  int? findBeforeIdx(Map<int, int?> map, int currentWeek) {
    for (int week in map.keys.toList().reversed) {
      if (currentWeek > week && map[week] != null) {
        return week;
      }
    }
    return null;
  }

  ///
  /// null 제거
  ///
  List<int> getNotNullList(List<int?> input) {
    List<int> result = [];
    for (int? data in input) {
      if (data != null) {
        result.add(data);
      }
    }
    return result;
  }

  ///
  ///
  ///

  ///
  /// 리스트 내 null이 아닌 최초의 value
  ///
  int firstValue(List<int?> input) {
    int? first = input.removeAt(0);
    if (first != null) {
      return first;
    } else {
      return firstValue(input);
    }
  }

///
/// 리스트 내 null이 아닌 valye의 인덱스중 짝수인지 홀수인지
///
}
