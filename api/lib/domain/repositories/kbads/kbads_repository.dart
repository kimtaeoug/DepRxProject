///
/// K-BADS 관련 Repository
///
abstract class KBADSRepository{
  Future save(List<int> valueList, int week, int round);
}