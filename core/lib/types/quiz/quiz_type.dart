import 'package:flutter/cupertino.dart';
import 'package:resource/colors.dart';
import 'package:resource/resource_manager.dart';

enum QuizType { normal, success, fail }

extension QuizTypeExtension on QuizType {
  static final ScreenUtil _screenUtil = ScreenUtil();

  String get imgPath {
    switch (this) {
      case QuizType.normal:
        return '';
      case QuizType.success:
        return 'ic_check';
      case QuizType.fail:
        return 'ic_close_error';
    }
  }

  Color get iconColor {
    switch (this) {
      case QuizType.normal:
        return DColors.transparent;
      case QuizType.success:
        return DColors.primaryNormalColor;
      case QuizType.fail:
        return DColors.negativeStatusRed;
    }
  }

  Color get bannerBgColor {
    switch (this) {
      case QuizType.normal:
        return DColors.transparent;
      case QuizType.success:
        return DColors.primaryNormalColor.withValues(alpha: 0.1);
      case QuizType.fail:
        return DColors.negativeStatusRed.withValues(alpha: 0.1);
    }
  }

  BoxDecoration get decoration {
    switch (this) {
      case QuizType.normal:
        return BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.white,
            boxShadow: _screenUtil.pressShadow());
      case QuizType.success:
        return BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.bgBlueColor,
            boxShadow: _screenUtil.emphasizeShadow(),
            border: Border.all(color: DColors.primaryNormalColor));
      case QuizType.fail:
        return BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.white,
            border: Border.all(color: DColors.negativeStatusRed),
            boxShadow: _screenUtil.emphasizeShadow());
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case QuizType.normal:
        return DpTextStyle.b2.style.copyWith(
          color: DColors.labelNeutralColor2,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
      case QuizType.success:
        return DpTextStyle.b2.style.copyWith(
          color: DColors.primaryNormalColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
      case QuizType.fail:
        return DpTextStyle.b2.style.copyWith(
          color: DColors.negativeStatusRed,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
    }
  }
  TextStyle get bannerTextStyle {
    switch (this) {
      case QuizType.normal:
        return DpTextStyle.b3.style;
      case QuizType.success:
        return DpTextStyle.b3.style.copyWith(
          color: DColors.primaryNormalColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
      case QuizType.fail:
        return DpTextStyle.b3.style.copyWith(
          color: DColors.negativeStatusRed,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
    }
  }
  String get bannerText{
    switch(this){
      case QuizType.normal:
        return '';
      case QuizType.success:
        return '정답이에요!';
      case QuizType.fail:
        return '한 번에 많은 활동을 계획하면 부담이 커지고 실천이 어려워질 수 있어요.';
    }
  }
}
