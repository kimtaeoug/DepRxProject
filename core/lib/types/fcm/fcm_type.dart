import 'package:api/api.dart';

enum FCMType { startBdi, finishBdi, ealyEnd, none }

extension FcmTypeExtension on FCMType {
  static FCMType guessType(Map<String, dynamic> input) {
    FCMEntity data = FCMEntity.fromJson(input);
    switch (data.data) {
      case 'startBdi':
        return FCMType.startBdi;
      case 'finishBdi':
        return FCMType.finishBdi;
      case 'ealyEnd':
        return FCMType.ealyEnd;
      default:
        return FCMType.none;
    }
  }

  static FCMType guessTypeFromString(String input) {
    switch (input) {
      case 'startBdi':
        return FCMType.startBdi;
      case 'finishBdi':
        return FCMType.finishBdi;
      case 'ealyEnd':
        return FCMType.ealyEnd;
      default:
        return FCMType.none;
    }
  }
}
//1차 BDI : {‘data’ : ‘startBdi’}
// 2차 BDI: {‘data’ : ‘finishBdi’}
// 조기 종료 : {‘data’ : ‘ealyEnd’}
