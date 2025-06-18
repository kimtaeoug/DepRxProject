import 'package:get/get.dart';

import 'app_info_item_type.dart';

///
/// 버전 : version
/// 오픈소스 라이센스 : opensource
/// 제조사 : Manufacturer
/// 주소 : address
/// 연락처 :
/// 제조번호 : mNumber(Manufacturing number)
/// 제조일자 : dom (Date of Manufacture )
/// 제품명 : pn (Product Name)
/// 모델명 : mn (Model Name)
/// 중량 또는 포장 단위 : wopu (Weight or packaging unit)
/// 품목허가번호 : iln(Item license number)
///
enum AppInfoType {
  version,
  opensource,
  manufacturer,
  address,
  contact,
  mNumber,
  dom,
  pn,
  mn,
  wopu,
  iln,
}

extension AppInfoTypeExtension on AppInfoType {
  String get label {
    switch (this) {
      case AppInfoType.version:
        return 'appInfo_cell_version_title'.tr;
      case AppInfoType.opensource:
        return 'appInfo_cell_opensource_title'.tr;
      case AppInfoType.manufacturer:
        return 'appInfo_cell_company_title'.tr;
      case AppInfoType.address:
        return 'common_address'.tr;
      case AppInfoType.mNumber:
        return 'appInfo_cell_manufacturingNumber_title'.tr;
      case AppInfoType.dom:
        return 'appInfo_cell_manufacturingDate_title'.tr;
      case AppInfoType.pn:
        return 'appInfo_cell_productName_title'.tr;
      case AppInfoType.mn:
        return 'appInfo_cell_modelName_title'.tr;
      case AppInfoType.iln:
        return 'appInfo_cell_approvalNumber_title'.tr;
      case AppInfoType.contact:
        return 'appInfo_cell_contact_title'.tr;
      case AppInfoType.wopu:
        return 'appInfo_cell_packingUnit_title'.tr;
    }
  }

  AppInfoItemType get widgetType {
    if (this == AppInfoType.version) {
      return AppInfoItemType.version;
    } else if (this == AppInfoType.opensource) {
      return AppInfoItemType.button;
    } else {
      return AppInfoItemType.value;
    }
  }

  String get data {
    switch (this) {
      case AppInfoType.version:
        return 'v. 1. 0. 0';
      case AppInfoType.opensource:
        return '';
      case AppInfoType.manufacturer:
        return 'appInfo_cell_company_value'.tr;
      case AppInfoType.address:
        return 'appInfo_cell_address_value'.tr;
      case AppInfoType.mNumber:
        return '(01)08800278590003(10)100(11)240628(91)DepRx';
      case AppInfoType.dom:
        return '2024.06.28';
      case AppInfoType.pn:
        return 'DepRx';
      case AppInfoType.mn:
        return 'TBIO-D-TA';
      case AppInfoType.iln:
        return 'appInfo_cell_approvalNumber_value'.tr;
      case AppInfoType.contact:
        return 'T: 031-600-7560\nE-mail: info@turingbio.com';
      case AppInfoType.wopu:
        return '1ea';
    }
  }
}
