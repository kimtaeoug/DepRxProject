import 'package:get/get.dart';

///
/// 호흡기 질환(rd, Respiratory Disease)
/// 간질환(ld, Liver Disease)
/// 대사질환(md, Metabolic Disease)
/// 정형외과 질환(msd, Musculoskeletal Disease)
/// 안과질환(od, Ocular Disease)
/// 각종 음식물 알레르기(fa, Food Allergy)
/// 피부질환(sd, Skin Disease)
/// 위장질환(gd, Gastrointestinal Disease)
/// 해당 없음(none)
enum DiseaseType { rd, ld, md, msd, od, fa, sd, gd, none}

extension DiseaseTypeExtension on DiseaseType {
  String get label {
    switch (this) {
      case DiseaseType.rd:
        return 'disease_toggleChip_1'.tr;
      case DiseaseType.ld:
        return 'disease_toggleChip_2'.tr;
      case DiseaseType.md:
        return 'disease_toggleChip_3'.tr;
      case DiseaseType.msd:
        return 'disease_toggleChip_4'.tr;
      case DiseaseType.od:
        return 'disease_toggleChip_5'.tr;
      case DiseaseType.fa:
        return 'disease_toggleChip_6'.tr;
      case DiseaseType.sd:
        return 'disease_toggleChip_7'.tr;
      case DiseaseType.gd:
        return 'disease_toggleChip_8'.tr;
      case DiseaseType.none:
        return 'disease_toggleChip_9'.tr;
    }
  }
}
