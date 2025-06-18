import 'package:get/get.dart';

///
/// 가족관계 - fam
/// 이성관계 - ro (romantic relationship)
/// 우정, 사회적 관계 - fsr (freindship social relationship) -
/// 신체적 웰빙 - pb(physical well-being)
/// 정신건강 - mh(mental health)
/// 종교 - re(religious)
/// 교육/자기개발 - edsd(Education, Self-Development)
/// 직업/커리어 - jcr (job / career)
/// 봉사 - vo (volunteering)
/// 취미/여가 - hmlr (Hobbies and Interests, Leisure)
///
enum InterestingKeywordType { fm, ro, fsr, pb, mh, re, edsd, jcr, vo, hmlr }

extension InterestingKeywordTypeExtension on InterestingKeywordType {
  String get label {
    switch (this) {
      case InterestingKeywordType.fm:
        return 'userKeyword_toggleChip_1'.tr;
      case InterestingKeywordType.ro:
        return 'userKeyword_toggleChip_2'.tr;
      case InterestingKeywordType.fsr:
        return 'userKeyword_toggleChip_3'.tr;
      case InterestingKeywordType.pb:
        return 'userKeyword_toggleChip_4'.tr;
      case InterestingKeywordType.mh:
        return 'userKeyword_toggleChip_5'.tr;
      case InterestingKeywordType.re:
        return 'userKeyword_toggleChip_6'.tr;
      case InterestingKeywordType.edsd:
        return 'userKeyword_toggleChip_7'.tr;
      case InterestingKeywordType.jcr:
        return 'userKeyword_toggleChip_8'.tr;
      case InterestingKeywordType.vo:
        return 'userKeyword_toggleChip_9'.tr;
      case InterestingKeywordType.hmlr:
        return 'userKeyword_toggleChip_10'.tr;
    }
  }

  String get value {
    switch (this) {
      case InterestingKeywordType.fm:
        return 'family';
      case InterestingKeywordType.ro:
        return 'partner';
      case InterestingKeywordType.fsr:
        return 'relationship';
      case InterestingKeywordType.pb:
        return 'well-being';
      case InterestingKeywordType.mh:
        return 'mental';
      case InterestingKeywordType.re:
        return 'religion';
      case InterestingKeywordType.edsd:
        return 'education';
      case InterestingKeywordType.jcr:
        return 'job';
      case InterestingKeywordType.vo:
        return 'volunteer';
      case InterestingKeywordType.hmlr:
        return 'hobby';
    }
  }
  String get koreanValue{
    switch(this){
      case InterestingKeywordType.fm:
        return '가족관계';
      case InterestingKeywordType.ro:
        return '이성관계';
      case InterestingKeywordType.fsr:
        return '우정, 사회적 관계';
      case InterestingKeywordType.pb:
        return '신체적 웰빙';
      case InterestingKeywordType.mh:
        return '정신건강';
      case InterestingKeywordType.re:
        return '종교';
      case InterestingKeywordType.edsd:
        return '교육/자기개발';
      case InterestingKeywordType.jcr:
        return '직업/커리어';
      case InterestingKeywordType.vo:
        return '봉사';
      case InterestingKeywordType.hmlr:
        return '취미/여가';
    }
  }
}
