///
/// Report 관련 Repository
///
abstract class ReportRepository{
  //주간 리포트
  Future weekReport(int round, int week);
  //회차 리포트
  Future roundReport(int round);
  //리포트 체크하기
  Future checkReport(int round, int week);
}