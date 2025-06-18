///
/// BDI 관련 Repository
///
abstract class BDIRepository{
  //bdi 자동 입력 완료
  Future autoComplete();
  //bdi 저장
  Future saveBDI(List<int> bdiList);
  //bdi 자동 입력 대기
  Future waitBDI();
  //BDI 결과
  Future bdiResult();
  //프로그램 시작
  Future startProgram();
}