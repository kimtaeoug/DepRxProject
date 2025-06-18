///
/// 교육 관련 Repository
///
abstract class EducationRepository{
  //교육 진행 완료
  Future complete(int eduWeek);
  //남은 교육 리스트 가져오기
  Future getLastEdu();
}