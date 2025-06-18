import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

///
/// 약관 관련 type
///
enum TermType { service, privacyConsent, privacyPolicy, marketing }

extension TermTypeExtension on TermType {
  String get label {
    switch (this) {
      case TermType.service:
        return 'common_service'.tr;
      case TermType.privacyConsent:
        return 'common_privacyConsent'.tr;
      case TermType.privacyPolicy:
        return 'common_privacyPolicy'.tr;
      case TermType.marketing:
        return 'common_marketing'.tr;
    }
  }

  String get route {
    switch (this) {
      case TermType.service:
        return Routes.signUpTermService;
      case TermType.privacyConsent:
        return Routes.signUpTermPrivacyConsent;
      case TermType.privacyPolicy:
        return Routes.signUpTermPrivacyPolicy;
      case TermType.marketing:
        return Routes.signUpTermMarketing;
    }
  }

  String get jsonPath {
    switch (this) {
      case TermType.service:
        return 'service';
      case TermType.privacyConsent:
        return 'privacy_consent';
      case TermType.privacyPolicy:
        return 'privacy_policy';
      case TermType.marketing:
        return 'marketing';
    }
  }

  static Future<TermModel> model(TermType type, JsonService service) async {
    return await Resource.termData(type.jsonPath, service);
  }

  int get idx {
    switch (this) {
      case TermType.service:
        return 1;
      case TermType.privacyConsent:
        return 2;
      case TermType.privacyPolicy:
        return 3;
      case TermType.marketing:
        return 4;
    }
  }
}
