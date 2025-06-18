import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:resource/resource_manager.dart';

import '../config/routes.dart';
import '../utils/logger_util.dart';

///
/// edu -> education
/// ema -> today_emotion
/// kbads -> kbads
/// rpu -> rewardPickUp
/// rs -> rewardSelect
/// rsi -> reward2WeekSelect
/// rpui -> reward2WeekPickUp
/// report -> report
/// as -> actionSelect
/// keyword -> membershipProcess : 0
/// bdi -> membershipProcess : 1
/// fkbads -> final_kbads
/// frpu -> reward8PickUp
/// freprt -> finalReport
/// freward -> finalReward
/// main
/// fmain
///
/// edu1, edu2, edu3
enum SequenceType {
  edu,
  ema,
  kbads,
  rpu,
  rs,
  rsi,
  rpui,
  report,
  as,
  keyword,
  bdi,
  fkbads,
  frpu,
  freport,
  freward,
  main,
  fmain,
  none,
  mc,
  bw
}

extension SequenceTypeExtension on SequenceType {
  ///
  /// route
  ///
  String get route {
    switch (this) {
      case SequenceType.edu:
        return Routes.educationPage;
      case SequenceType.ema:
        return Routes.todayEmotionPage;
      case SequenceType.kbads:
        return Routes.kBADSIntro;
      case SequenceType.rpu:
        return Routes.rewardReceiveWeekPage;
      case SequenceType.rs:
        return Routes.rewardSelectPage;
      case SequenceType.rsi:
        return Routes.rewardSelectPage;
      case SequenceType.rpui:
        return Routes.rewardReceiveWeekPage;
      case SequenceType.report:
        return Routes.reportDetailPage;
      case SequenceType.as:
        return Routes.activitySelectPage;
      case SequenceType.keyword:
        return Routes.signUpKeyword;
      case SequenceType.bdi:
        return Routes.bdiSelectPage;
      case SequenceType.fkbads:
        return Routes.kBADSIntro;
      case SequenceType.frpu:
        return Routes.rewardReceiveWeekPage;
      case SequenceType.freport:
        return Routes.reportDetailPage;
      case SequenceType.freward:
        return Routes.rewardFinalPage;
      case SequenceType.main:
        return Routes.homePage;
      case SequenceType.fmain:
        return Routes.homePage;
      case SequenceType.none:
        return Routes.socialLogin;
      case SequenceType.mc:
        return Routes.bdiAutoCompletePage;
      case SequenceType.bw:
        return Routes.bdiLoadingPage;
    }
  }

  ///
  /// String to SequenceType
  ///
  static SequenceType convertStringToSequenceType(String input) {
    switch (input) {
      case 'edu':
        return SequenceType.edu;
      case 'ema':
        return SequenceType.ema;
      case 'kbads':
        return SequenceType.kbads;
      case 'rpu':
        return SequenceType.rpu;
      case 'rs':
        return SequenceType.rs;
      case 'rsi':
        return SequenceType.rsi;
      case 'rpui':
        return SequenceType.rpui;
      case 'report':
        return SequenceType.report;
      case 'as':
        return SequenceType.as;
      case 'keyword':
        return SequenceType.keyword;
      case 'bdi':
        return SequenceType.bdi;
      case 'fkbads':
        return SequenceType.fkbads;
      case 'frpu':
        return SequenceType.frpu;
      case 'freport':
        return SequenceType.freport;
      case 'freward':
        return SequenceType.freward;
      case 'main':
        return SequenceType.main;
      case 'fmain':
        return SequenceType.fmain;
      case 'bw':
        return SequenceType.bw;
      case 'mc':
        return SequenceType.mc;
      default:
        return SequenceType.main;
    }
  }

  ///
  /// Route to Type
  ///

  static SequenceType convertRouteToType(String route,
      {int week = 0, bool firstWeekIn2Week = false, bool isFinal = false}) {
    switch (route) {
      case Routes.educationPage:
        return SequenceType.edu;
      case Routes.todayEmotionPage:
        return SequenceType.ema;
      case Routes.kBADSIntro:
        if (isFinal) {
          return SequenceType.fkbads;
        } else {
          return SequenceType.kbads;
        }
      case Routes.rewardReceiveWeekPage:
        if (firstWeekIn2Week) {
          return SequenceType.rpui;
        } else {
          if (isFinal) {
            return SequenceType.frpu;
          } else {
            return SequenceType.rpu;
          }
        }
      case Routes.rewardSelectPage:
        if (firstWeekIn2Week) {
          return SequenceType.rsi;
        } else {
          return SequenceType.rs;
        }
      case Routes.reportDetailPage:
        if (isFinal) {
          return SequenceType.freport;
        } else {
          return SequenceType.report;
        }
      case Routes.activitySelectPage:
        return SequenceType.as;
      case Routes.signUpKeyword:
        return SequenceType.keyword;
      case Routes.bdiSelectPage:
        return SequenceType.bdi;
      case Routes.rewardFinalPage:
        return SequenceType.freward;
      case Routes.homePage:
        if (isFinal) {
          return SequenceType.fmain;
        } else {
          return SequenceType.main;
        }
      case Routes.bdiLoadingPage:
        return SequenceType.bw;
      case Routes.bdiAutoCompletePage:
        return SequenceType.mc;
      default:
        return SequenceType.main;
    }
  }

  ///
  /// Week2 Reward
  ///
  static final List<SequenceType> _week2RewardList = [
    SequenceType.rsi,
    SequenceType.rpui
  ];

  ///
  /// Routing Function
  ///
  static Future<bool> move(SequenceType type, int week) async {
    try {
      if (type == SequenceType.edu) {
        _eduMove(type);
      } else if (_week2RewardList.contains(type)) {
        _week2RewardMove(type);
      } else if (_final.contains(type)) {
        _processFinal(type, week);
      } else {
        if (type == SequenceType.kbads || type == SequenceType.fkbads) {
          KbadsUtil().initData(JsonService());
        }
        await Get.toNamed(type.route);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> mustMove(String sequence) async {
    try {
      Log.e('here! : $sequence');
      SequenceType type = convertStringToSequenceType(sequence);
      Get.toNamed(type.route);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _eduMove(SequenceType type) async {
    try {
      await Get.toNamed(type.route);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _week2RewardMove(SequenceType type) async {
    try {
      await Get.toNamed(type.route, arguments: {'rsi': true},);
      return true;
    } catch (e, s) {
      Log.e('Error : $e\nStackTrace : $s');
      return false;
    }
  }

  static Future<bool> _processFinal(SequenceType type, int week) async {
    try {
      if (type == SequenceType.fkbads) {
        await Get.toNamed(type.route, arguments: {'isLast': true},);
      } else if (type == SequenceType.frpu) {
        await Get.toNamed(type.route, arguments: {'isLast': true},);
      } else if (type == SequenceType.freward) {
        await Get.toNamed(type.route,);
      } else if (type == SequenceType.freport) {
        await Get.toNamed(type.route,
          arguments: {'isFromTab': false, 'week': week, 'isLast': true},);
      } else {
        await Get.toNamed(type.route);
      }
      return true;
    } catch (e, s) {
      Log.e('Error : $e\nStackTrace : $s');
      return false;
    }
  }

  static List<SequenceType> weekData(int week, {bool isFinal = false}) {
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

  static final List<SequenceType> _week0 = [
    SequenceType.keyword,
    SequenceType.bdi,
    SequenceType.bw,
    SequenceType.mc
  ];

  static final List<SequenceType> _week1 = [
    SequenceType.edu,
    SequenceType.ema,
    SequenceType.as,
    SequenceType.main
  ];
  static final List<SequenceType> _week2 = [
    SequenceType.edu,
    SequenceType.ema,
    SequenceType.kbads,
    SequenceType.rsi,
    SequenceType.rpui,
    SequenceType.report,
    SequenceType.as,
    SequenceType.rs,
    SequenceType.main
  ];
  static final List<SequenceType> _week3 = [
    SequenceType.edu,
    SequenceType.ema,
    SequenceType.kbads,
    SequenceType.rpu,
    SequenceType.report,
    SequenceType.as,
    SequenceType.rs,
    SequenceType.main
  ];

  //4~8주차
  static final List<SequenceType> _defaultWeek = [
    SequenceType.edu,
    SequenceType.ema,
    SequenceType.kbads,
    SequenceType.rpu,
    SequenceType.report,
    SequenceType.as,
    SequenceType.rs,
    SequenceType.main
  ];
  static final List<SequenceType> _final = [
    SequenceType.fkbads,
    SequenceType.frpu,
    SequenceType.freward,
    SequenceType.freport,
    SequenceType.fmain
  ];

  static bool isFinal(String inputRoute) =>
      _final.contains(convertStringToSequenceType(inputRoute));
}
