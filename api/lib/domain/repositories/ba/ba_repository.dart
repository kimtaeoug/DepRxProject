import '../../entities/ba/ongoing_ba_entity.dart';
import '../../entities/ba/selected_ba_entity.dart';

///
/// BA 관련 Repository
///
abstract class BARepository{
  //선택 BA 저장
  Future saveSelectedBA(SelectedBAEntity data);
  //일간 진행할 행동 리스트 가져오기
  Future getTodayBAList();
  //BA 진행 정보 저장하기
  Future saveBA(OngoingBAEntity data);
  //추천 BA 리스트 가져오기
  Future getRecommendedBAList();
  //한달간 진행할 행동 리스트 가져오기
  Future getMonthBAList(String yearMonth);
  //프로그램 첫날, 마지막날 가져오기
  Future getProgramInfo();
}