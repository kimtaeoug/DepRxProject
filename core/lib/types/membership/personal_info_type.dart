import 'package:get/get.dart';

enum PersonalInfoType{
  name, birth, address, phone
}
extension PersonalInfoTypeExtension on PersonalInfoType{
  String get label{
    switch(this){
      case PersonalInfoType.name:
        return 'userSummary_checkCell_labelName'.tr;
      case PersonalInfoType.birth:
        return 'userSummary_checkCell_labelGenderBirth'.tr;
      case PersonalInfoType.address:
        return 'common_address'.tr;
      case PersonalInfoType.phone:
        return 'userSummary_checkCell_labelPhone'.tr;
    }
  }
}
