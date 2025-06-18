import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../../config/constants.dart';

///
/// 소셜 로그인 타입
///
enum SocialType { google, kakao, naver }

extension SocailLoginStyle on SocialType {
  String get upper => name.toUpperCase();

  String get title {
    switch (this) {
      case SocialType.google:
        return 'login_socialLoginBtn_google'.tr;
      case SocialType.kakao:
        return 'login_socialLoginBtn_kakao'.tr;
      case SocialType.naver:
        return 'login_socialLoginBtn_naver'.tr;
    }
  }

  String get imgPath => 'ic_${name}_logo';

  Color get color {
    switch (this) {
      case SocialType.google:
        return DColors.white;
      case SocialType.kakao:
        return DColors.kakaoColor;
      case SocialType.naver:
        return DColors.naverColor;
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case SocialType.google:
        return DpTextStyle.b1.style.copyWith(
            height: 1.6,
            fontWeight: FontWeight.w600,
            color: DColors.black.withValues(alpha: 0.54));
      case SocialType.kakao:
        return DpTextStyle.b1.style.copyWith(
            height: 1.6,
            fontWeight: FontWeight.w600,
            color: DColors.black);
      case SocialType.naver:
        return DpTextStyle.b1.style.copyWith(
            height: 1.6,
            fontWeight: FontWeight.w600,
            color: DColors.white);
    }
  }
}
