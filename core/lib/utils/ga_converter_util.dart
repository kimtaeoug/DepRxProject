import 'package:api/data/model/reward/reward_model.dart';

class GAConverterUtil{
  //-2, -1, 0, 1, 2
  static String _convertValue(int value){
    switch(value){
      case 0:
        return '-2(매우 나쁨)';
      case 1:
        return '-1(나쁨)';
      case 2:
        return '0(보통)';
      case 3:
        return '1(좋음)';
      case 4:
        return '2(매우 좋음)';
      default:
        return '';
    }
  }
  static List<String> convertList(List<int> valueList){
    return valueList.map((e) => _convertValue(e)).toList();
  }
  static String week(int week) => '$week주';
  static List<Map<String, dynamic>> convertRewardMain(List<RewardModel> dataList) {
    return dataList.map((e) => {
      e.value : e.why
    }).toList();
  }
  static String getRewardStorageTAB(int idx){
    switch(idx){
      case 0:
        return '전체';
      case 1:
        return '스탬프';
      case 2:
        return '감정';
      case 3:
        return '행동';
      default:
        return '';
    }
  }

  static String differTime(DateTime big, DateTime small){
    return '${big.difference(small).inSeconds}s';
  }

  static int convertStringToIntTime(String input){
    try{
      List<String> splitted = input.split(':');
      return (int.parse(splitted.first) * 60 ) + int.parse(splitted.last);
    }catch(e){
      return 0;
    }
  }

}