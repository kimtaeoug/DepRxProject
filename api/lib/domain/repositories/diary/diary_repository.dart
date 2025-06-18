abstract class DiaryRepository{
  Future saveRm(int round, int week, List<String> rmList);
  Future saveTd(String contents);
  Future saveTed(String emotion);

  Future getRm(int week, int round);
  Future getTd(String date);
  Future getTed(String date);

  Future getProgramInfo();
  Future month(String yearMonth);
}