import 'package:api/api_core/api_service_list.dart';

import 'endpoint.dart';
import 'http_method.dart';

///
/// EndPoint Type List
///
enum EndPointType {
  ///
  /// reward
  ///
  rewardList(EndPoint.rewardList, HttpMethod.get, true),
  rewardSave(EndPoint.rewardSave, HttpMethod.patch, true),
  rewardReceive(EndPoint.rewardReceive, HttpMethod.patch, true),
  rewardWeek(EndPoint.rewardWeek, HttpMethod.get, true),
  rewardAll(EndPoint.rewardAll, HttpMethod.get, true),
  rewardStamp(EndPoint.rewardStamp, HttpMethod.get, true),
  rewardMain(EndPoint.rewardMain, HttpMethod.get, true),
  rewardFinal(EndPoint.rewardFinal, HttpMethod.get, true),

  ///
  /// BA
  ///
  selectedBA(EndPoint.selectedBA, HttpMethod.post, true),
  getTodayBAList(EndPoint.getTodayBAList, HttpMethod.get, true),
  saveBA(EndPoint.saveBA, HttpMethod.post, true),
  getRecommendedBAList(EndPoint.getRecommendedBAList, HttpMethod.get, true),
  getMonthBAList(EndPoint.getMonthBAList, HttpMethod.get, true),
  getProgramInfo(EndPoint.programInfo, HttpMethod.get, true),

  ///
  /// Membership
  ///
  signUp(EndPoint.signUp, HttpMethod.post, false),
  signUpAlpha(EndPoint.signUpAlpha, HttpMethod.post, true),
  logout(EndPoint.signOut, HttpMethod.post, true),
  login(EndPoint.login, HttpMethod.post, false),
  checkPwd(EndPoint.checkPassword, HttpMethod.post, true),
  resetPWd(EndPoint.resetPassword, HttpMethod.post, true),
  checkDuplicateId(EndPoint.checkDuplicateId, HttpMethod.post, false),
  checkPatientCode(EndPoint.checkPatientCode, HttpMethod.post, false),
  leave(EndPoint.leave, HttpMethod.patch, true),
  certPhone(EndPoint.certificationPhone, HttpMethod.post, false),
  certPhoneConfirm(EndPoint.certificationPhoneConfirm, HttpMethod.post, false),
  findId(EndPoint.findId, HttpMethod.get, false),
  checkExistingId(EndPoint.checkExistingId, HttpMethod.get, false),
  findPwd(EndPoint.findPwd, HttpMethod.post, false),
  socialSignUp(EndPoint.socialSignUp, HttpMethod.post, false),
  socialLogin(EndPoint.socialLogin, HttpMethod.post, false),
  restoreMember(EndPoint.restoreMember, HttpMethod.patch, false),
  ga(EndPoint.ga, HttpMethod.get, true),

  ///
  /// BDI
  ///
  bdiAutoComplete(EndPoint.bdiAutoComplete, HttpMethod.get, true),
  bdiSave(EndPoint.bdiSave, HttpMethod.post, true),
  bdiWait(EndPoint.bdiWait, HttpMethod.get, true),
  bdiResult(EndPoint.bdiResult, HttpMethod.get, true),
  startProgram(EndPoint.startProgram, HttpMethod.post, true),

  ///
  /// Report
  ///
  weekReport(EndPoint.weekReport, HttpMethod.get, true),
  roundReport(EndPoint.roundReport, HttpMethod.get, true),
  checkReport(EndPoint.checkReport, HttpMethod.patch, true),

  ///
  /// MyPage
  ///
  changeMyPageMarketing(EndPoint.changeMyPageMarketing, HttpMethod.post, true),
  getMyPageMarketing(EndPoint.getMarketing, HttpMethod.get, true),
  resetMyPageAlarm(EndPoint.resetMyPageAlarm, HttpMethod.post, true),
  getMyPageReward(EndPoint.getMyPageReward, HttpMethod.get, true),
  getMyPageAlarm(EndPoint.getMyPageAlarm, HttpMethod.get, true),

  ///
  /// Etc
  ///
  attendance(EndPoint.attendance, HttpMethod.get, true),
  todayEmotion(EndPoint.todayEmotion, HttpMethod.post, true),
  kBADS(EndPoint.kbads, HttpMethod.post, true),
  SDUI(EndPoint.sdui, HttpMethod.post, true),
  education(EndPoint.education, HttpMethod.post, true),
  lastEducation(EndPoint.education, HttpMethod.get, true),
  procedure(EndPoint.procedure, HttpMethod.post, false),
  ranking(EndPoint.ranking, HttpMethod.get, true),
  getSysAlarm(EndPoint.getSysAlarm, HttpMethod.get, true),
  changeSysAlarm(EndPoint.changeSysAlarm, HttpMethod.patch, true),

  ///
  /// Diary
  ///
  saveRm(EndPoint.saveRm, HttpMethod.post, true),
  saveTd(EndPoint.saveTd, HttpMethod.post, true),
  saveTed(EndPoint.saveTed, HttpMethod.post, true),
  getRm(EndPoint.getRm, HttpMethod.get, true),
  getTd(EndPoint.getTd, HttpMethod.get, true),
  getTed(EndPoint.getTed, HttpMethod.get, true),

  ///
  /// Sham Task
  ///
  monthData(EndPoint.taskMonthData, HttpMethod.get, true),
  taskInfo(EndPoint.taskInfoData, HttpMethod.get, true),

  ///
  /// Naver
  ///
  naverLogin(EndPoint.naverLogin, HttpMethod.get, false);

  final String path;
  final HttpMethod method;
  final bool needAccessToken;

  const EndPointType(this.path, this.method, this.needAccessToken);
}

extension EndpointTypeExtension on EndPointType {
  String get path => this.path;

  HttpMethod get method => this.method;

  String get serviceName {
    switch (this) {
      case EndPointType.rewardList:
        return APIServiceList.REWARD;
      case EndPointType.rewardSave:
        return APIServiceList.REWARD;
      case EndPointType.rewardReceive:
        return APIServiceList.REWARD;
      case EndPointType.rewardWeek:
        return APIServiceList.REWARD;
      case EndPointType.rewardAll:
        return APIServiceList.REWARD;
      case EndPointType.rewardStamp:
        return APIServiceList.REWARD;
      case EndPointType.rewardMain:
        return APIServiceList.REWARD;
      case EndPointType.rewardFinal:
        return APIServiceList.REWARD;
      case EndPointType.selectedBA:
        return APIServiceList.BA;
      case EndPointType.getTodayBAList:
        return APIServiceList.BA;
      case EndPointType.saveBA:
        return APIServiceList.BA;
      case EndPointType.getRecommendedBAList:
        return APIServiceList.BA;
      case EndPointType.getMonthBAList:
        return APIServiceList.BA;
      case EndPointType.getProgramInfo:
        return APIServiceList.BA;
      case EndPointType.signUp:
        return APIServiceList.CUSTOMER;
      case EndPointType.signUpAlpha:
        return APIServiceList.CUSTOMER;
      case EndPointType.logout:
        return APIServiceList.CUSTOMER;
      case EndPointType.login:
        return APIServiceList.CUSTOMER;
      case EndPointType.checkPwd:
        return APIServiceList.CUSTOMER;
      case EndPointType.resetPWd:
        return APIServiceList.CUSTOMER;
      case EndPointType.checkDuplicateId:
        return APIServiceList.CUSTOMER;
      case EndPointType.checkPatientCode:
        return APIServiceList.CUSTOMER;
      case EndPointType.leave:
        return APIServiceList.CUSTOMER;
      case EndPointType.certPhone:
        return APIServiceList.CUSTOMER;
      case EndPointType.certPhoneConfirm:
        return APIServiceList.CUSTOMER;
      case EndPointType.findId:
        return APIServiceList.CUSTOMER;
      case EndPointType.checkExistingId:
        return APIServiceList.CUSTOMER;
      case EndPointType.findPwd:
        return APIServiceList.CUSTOMER;
      case EndPointType.socialSignUp:
        return APIServiceList.CUSTOMER;
      case EndPointType.socialLogin:
        return APIServiceList.CUSTOMER;
      case EndPointType.bdiAutoComplete:
        return APIServiceList.BDI;
      case EndPointType.bdiSave:
        return APIServiceList.BDI;
      case EndPointType.bdiWait:
        return APIServiceList.BDI;
      case EndPointType.bdiResult:
        return APIServiceList.BDI;
      case EndPointType.startProgram:
        return APIServiceList.PROCEDURE;
      case EndPointType.weekReport:
        return APIServiceList.REPORT;
      case EndPointType.roundReport:
        return APIServiceList.REPORT;
      case EndPointType.checkReport:
        return APIServiceList.REPORT;
      case EndPointType.changeMyPageMarketing:
        return APIServiceList.MYPAGE;
      case EndPointType.getMyPageMarketing:
        return APIServiceList.MYPAGE;
      case EndPointType.resetMyPageAlarm:
        return APIServiceList.MYPAGE;
      case EndPointType.getMyPageReward:
        return APIServiceList.MYPAGE;
      case EndPointType.getMyPageAlarm:
        return APIServiceList.MYPAGE;
      case EndPointType.attendance:
        return APIServiceList.ATTENDANCE;
      case EndPointType.todayEmotion:
        return APIServiceList.EMA;
      case EndPointType.kBADS:
        return APIServiceList.KBADS;
      case EndPointType.SDUI:
        return APIServiceList.SDUI;
      case EndPointType.education:
        return APIServiceList.EDUCATION;
      case EndPointType.lastEducation:
        return APIServiceList.EDUCATION;
      case EndPointType.procedure:
        return APIServiceList.PROCEDURE;
      case EndPointType.ranking:
        return APIServiceList.BA;
      case EndPointType.saveRm:
        return APIServiceList.RM;
      case EndPointType.saveTd:
        return APIServiceList.TD;
      case EndPointType.saveTed:
        return APIServiceList.TED;
      case EndPointType.getRm:
        return APIServiceList.RM;
      case EndPointType.getTd:
        return APIServiceList.TD;
      case EndPointType.getTed:
        return APIServiceList.TED;
      case EndPointType.monthData:
        return APIServiceList.TASK;
      case EndPointType.taskInfo:
        return APIServiceList.TASK;
      case EndPointType.restoreMember:
        return APIServiceList.CUSTOMER;
      case EndPointType.ga:
        return APIServiceList.CUSTOMER;
      case EndPointType.naverLogin:
        return APIServiceList.CUSTOMER;
      case EndPointType.getSysAlarm:
        return APIServiceList.TD;
      case EndPointType.changeSysAlarm:
        return APIServiceList.TD;
    }
  }
}
