import 'package:api/api.dart';
import 'package:core/core.dart';

enum KbadsGradeType { grade1, grade2, grade3, grade4 }

extension KbadsGradeTypeExtension on KbadsGradeType {
  ///
  /// kbads type + value 받았을 때 어떤 grade인지
  ///
  static KbadsGradeType whichGrade(KbadsItemModel model, int value) {
    //grade1
    KbadsGradeModel grade1 = model.grade1;
    if (grade1.min <= value && value <= grade1.max) {
      return KbadsGradeType.grade1;
    }
    //grade2
    KbadsGradeModel grade2 = model.grade2;
    if (grade2.min <= value && value <= grade2.max) {
      return KbadsGradeType.grade2;
    }
    //grade3
    KbadsGradeModel grade3 = model.grade3;
    if (grade3.min <= value && value <= grade3.max) {
      return KbadsGradeType.grade3;
    }
    return KbadsGradeType.grade4;
  }
  static KbadsGradeModel convert(KbadsItemModel model, KbadsGradeType type){
    switch(type){
      case KbadsGradeType.grade1:
        return model.grade1;
      case KbadsGradeType.grade2:
        return model.grade2;
      case KbadsGradeType.grade3:
        return model.grade3;
      case KbadsGradeType.grade4:
        return model.grade4;
    }
  }
}
