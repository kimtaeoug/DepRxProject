import 'package:core/core.dart';
import 'package:get/get.dart';

///
/// MemberShip
/// keyword, bdi, bw, mc
///
/// edu, ted, kbads, sbj, rpu, report, main
///
enum ShamSequenceType {
  keyword,
  bdi,
  bw,
  mc,
  edu,
  ted,
  kbads,
  sbj,
  rpu,
  report,
  main,
  none,
  fkbads,
  frpu,
  freport,
  freward,
  fmain,
}

extension ShamSequenceTypeExtension on ShamSequenceType {
  String get route {
    switch (this) {
      case ShamSequenceType.edu:
        return Routes.educationPage;
      case ShamSequenceType.kbads:
        return Routes.kBADSIntro;
      case ShamSequenceType.rpu:
        return Routes.rewardReceiveWeekPage;
      case ShamSequenceType.report:
        return Routes.reportDetailPage;
      case ShamSequenceType.keyword:
        return Routes.signUpKeyword;
      case ShamSequenceType.bdi:
        return Routes.bdiSelectPage;
      case ShamSequenceType.main:
        return Routes.homePage;
      case ShamSequenceType.mc:
        return Routes.bdiAutoCompletePage;
      case ShamSequenceType.bw:
        return Routes.bdiLoadingPage;
      case ShamSequenceType.ted:
        return Routes.tedPage;
      case ShamSequenceType.sbj:
        return Routes.sbjPage;
      case ShamSequenceType.fkbads:
        return Routes.kBADSIntro;
      case ShamSequenceType.frpu:
        return Routes.rewardReceiveWeekPage;
      case ShamSequenceType.freport:
        return Routes.reportDetailPage;
      case ShamSequenceType.freward:
        return Routes.rewardFinalPage;
      case ShamSequenceType.fmain:
        return Routes.homePage;
      case ShamSequenceType.none:
        return Routes.homePage;
    }
  }

  static ShamSequenceType convertStringToShamSequenceType(String input) {
    switch (input) {
      case 'edu':
        return ShamSequenceType.edu;
      case 'kbads':
        return ShamSequenceType.kbads;
      case 'rpu':
        return ShamSequenceType.rpu;
      case 'report':
        return ShamSequenceType.report;
      case 'keyword':
        return ShamSequenceType.keyword;
      case 'bdi':
        return ShamSequenceType.bdi;
      case 'main':
        return ShamSequenceType.main;
      case 'bw':
        return ShamSequenceType.bw;
      case 'mc':
        return ShamSequenceType.mc;
      case 'ted':
        return ShamSequenceType.ted;
      case 'sbj':
        return ShamSequenceType.sbj;
      case 'fkbads':
        return ShamSequenceType.fkbads;
      case 'frpu':
        return ShamSequenceType.frpu;
      case 'freport':
        return ShamSequenceType.freport;
      case 'freward':
        return ShamSequenceType.freward;
      case 'fmain':
        return ShamSequenceType.fmain;
      default:
        return ShamSequenceType.main;
    }
  }

  ///
  /// Routing Function
  ///
  static Future<bool> move(ShamSequenceType type, int week) async {
    try {
      await Get.toNamed(type.route);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> mustMove(String sequence) async {
    try {
      ShamSequenceType type = convertStringToShamSequenceType(sequence);
      Get.toNamed(type.route);
      return true;
    } catch (e) {
      return false;
    }
  }

  static List<ShamSequenceType> weekData(int week, {bool isFinal = false}) {
    switch (week) {
      case 0:
        return _week0;
      case 1:
        return _week1;
      case 2:
        return _week2;
      case 3:
        return _week3;
      case 4:
        return _defaultWeek;
      case 5:
        return _defaultWeek;
      case 6:
        return _defaultWeek;
      case 7:
        return _defaultWeek;
      case 8:
        if (isFinal) {
          return _final;
        } else {
          return _defaultWeek;
        }
      default:
        return [];
    }
  }

  static final List<ShamSequenceType> _week0 = [
    ShamSequenceType.keyword,
    ShamSequenceType.bdi,
    ShamSequenceType.bw,
    ShamSequenceType.mc
  ];
  static final List<ShamSequenceType> _week1 = [
    ShamSequenceType.edu,
    ShamSequenceType.ted,
    ShamSequenceType.main
  ];
  static final List<ShamSequenceType> _week2 = [
    ShamSequenceType.edu,
    ShamSequenceType.kbads,
    ShamSequenceType.rpu,
    ShamSequenceType.report,
    ShamSequenceType.ted,
    ShamSequenceType.main
  ];
  static final List<ShamSequenceType> _week3 = [
    ShamSequenceType.edu,
    ShamSequenceType.kbads,
    ShamSequenceType.rpu,
    ShamSequenceType.report,
    ShamSequenceType.ted,
    ShamSequenceType.main
  ];
  static final List<ShamSequenceType> _defaultWeek = [
    ShamSequenceType.edu,
    ShamSequenceType.sbj,
    ShamSequenceType.kbads,
    ShamSequenceType.rpu,
    ShamSequenceType.report,
    ShamSequenceType.ted,
    ShamSequenceType.main
  ];
  static final List<ShamSequenceType> _final = [
    ShamSequenceType.fkbads,
    ShamSequenceType.frpu,
    ShamSequenceType.freward,
    ShamSequenceType.freport,
    ShamSequenceType.fmain
  ];
}
