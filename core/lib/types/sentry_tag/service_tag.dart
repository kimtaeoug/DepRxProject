///
/// Sentry Service Tag
/// 출석 : Attendance
/// EMA : ema
/// K-BADS : kbads
/// SDUI : sdui
/// Report : report
/// BDI : bdi
/// Education : education
/// Customer : customer
/// BA : ba
/// Procedure : procedure
/// MyPage : mypage
/// Reward :reward
///
enum ServiceTag{
  attendance, ema, kbads, sdui, report, bdi, education, customer, ba, procedure, mypage, reward
}
extension ServiceTagExtension on ServiceTag{
  static final String key = 'service';
  Map<String, String> get tag => {key : name};
}