import 'package:core/config/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:common/common.dart';

///
/// 나를 알아보기 -> rm(recognize me)
/// 오늘의 감정 일기 -> ted(today emotion diary)
/// 오늘의 일기 -> td(today diary)
/// 아무것도 아님 -> none
///
enum DiaryType { rm, ted, td, none }

extension DiaryTypeExtension on DiaryType {
  static DiaryType whichDiary(String input) {
    switch (input) {
      case 'rm':
        return DiaryType.rm;
      case 'ted':
        return DiaryType.ted;
      case 'td':
        return DiaryType.td;
      case '오늘의 일기':
        return DiaryType.td;
      case '오늘의 감정 일기':
        return DiaryType.ted;
      case '나를 알아보기':
        return DiaryType.rm;
      default:
        return DiaryType.none;
    }
  }

  String get route {
    switch (this) {
      case DiaryType.rm:
        return Routes.rmPage;
      case DiaryType.ted:
        return Routes.tedPage;
      case DiaryType.td:
        return Routes.tdPage;
      case DiaryType.none:
        return Routes.tdPage;
    }
  }

  String get icon {
    switch (this) {
      case DiaryType.rm:
        return 'ic_recognize_me';
      case DiaryType.ted:
        return 'ic_emotion_diary';
      case DiaryType.td:
        return 'ic_today_diary';
      case DiaryType.none:
        return '';
    }
  }

  String get text {
    switch (this) {
      case DiaryType.rm:
        return '나를 알아보기';
      case DiaryType.ted:
        return '오늘의 감정 일기';
      case DiaryType.td:
        return '오늘의 일기';
      case DiaryType.none:
        return '';
    }
  }

  TextStyle get itemTitleStyle {
    switch (this) {
      case DiaryType.rm:
        return DpTextStyle.h6.style.copyWith(
            color: DColors.labelNormalColor, fontWeight: FontWeight.w700);
      case DiaryType.ted:
        return DpTextStyle.h3.style.copyWith(
            color: DColors.labelNormalColor, fontWeight: FontWeight.w700);
      case DiaryType.td:
        return DpTextStyle.h3.style.copyWith(
            color: DColors.labelNormalColor, fontWeight: FontWeight.w700);
      case DiaryType.none:
        return TextStyle();
    }
  }

  TextStyle get itemContentStyle => DpTextStyle.b2.style
      .copyWith(color: DColors.labelNeutralColor2, fontWeight: FontWeight.w500);

  BoxDecoration get itemContentsDecoration =>
      BoxDecoration(borderRadius: ScreenUtil().radius12, color: DColors.white);

  int get minLength {
    switch (this) {
      case DiaryType.rm:
        return 20;
      case DiaryType.ted:
        return 5;
      case DiaryType.td:
        return 100;
      case DiaryType.none:
        return 0;
    }
  }

  int get maxLength {
    switch (this) {
      case DiaryType.rm:
        return 150;
      case DiaryType.ted:
        return 20;
      case DiaryType.td:
        return 200;
      case DiaryType.none:
        return 0;
    }
  }

  static bool passCondition(DiaryType type, int length) {
    return length >= type.minLength && length <= type.maxLength;
  }

  static String? errorText(DiaryType type, int length, bool alreadyEnter) {
    if (!alreadyEnter) {
      return null;
    }
    String overflow = '자 이상 입력하셔야 해요!';
    String underflow = '자 이하로 입력하셔야 해요!';
    if (length < type.minLength) {
      return '${type.minLength} $overflow';
    } else if (length > type.maxLength) {
      return '${type.maxLength} $underflow';
    } else {
      return null;
    }
  }

  static void showDialog({required Function() rightFunction}) {
    DPDialog().showTitleWithSubtitle(
        '저장된 기록은 수정이 불가합니다!', '제출하시겠어요?', rightFunction,
        leftText: 'common_ctaBtn_no'.tr, rightText: 'common_ctaBtn_yes'.tr);
  }

  String get title => switch (this) {
        DiaryType.rm => '',
        DiaryType.ted => '오늘의 기분 또는 감정을 알려주세요.',
        DiaryType.td => '오늘 하루 중 가장 기억에 남는 일이 무엇인가요?',
        DiaryType.none => '',
      };

  //오늘의 일기 -> 오늘일 경우, 데이터 있으면 데이터 있는 페이지, 없으면 쓰기 페이지, 오늘 아닐 경우
  static void processDiaryPage(DiaryType type, bool done,
      {bool isToday = false, dynamic data}) async {
    if (type == DiaryType.td) {
      if (done) {
        await Get.toNamed(type.readRoute, arguments: {'data': data});
      } else {
        if (isToday) {
          await Get.toNamed(type.route);
        } else {
          await Get.toNamed(Routes.emptyDiaryPage);
        }
      }
    } else {
      if (done) {
        await Get.toNamed(type.readRoute, arguments: {'data': data});
      } else {
        await Get.toNamed(Routes.emptyDiaryPage);
      }
    }
    return;
  }

  String get readRoute {
    switch (this) {
      case DiaryType.rm:
        return Routes.readRmPage;
      case DiaryType.ted:
        return Routes.readTedPage;
      case DiaryType.td:
        return Routes.readTdPage;
      case DiaryType.none:
        return Routes.emptyDiaryPage;
    }
  }
  String get hintText{
    switch(this){
      case DiaryType.rm:
        return '';
      case DiaryType.ted:
        return '예시) 오늘은 기분이~';
      case DiaryType.td:
        return '예시: 오늘 하루 중 가장 기억에 남는 일이 무엇인가요?';
      case DiaryType.none:
        return '';
    }
  }
}
