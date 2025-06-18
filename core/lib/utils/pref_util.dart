import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Shared Preference Util
///
@pragma('vm:entry-point')
class PrefUtil {
  static final PrefUtil _instance = PrefUtil._();

  PrefUtil._();

  factory PrefUtil() => _instance;

  SharedPreferences? _pref;

  final ValueNotifier<bool> _alreadyInit = ValueNotifier(false);

  bool get alreadyInit => _alreadyInit.value;

  void init({bool isSham = false}) async {
    _pref = await SharedPreferences.getInstance();
    initOnBoardingData();
    initMemberShip();
    if (isSham) {
      getQuizData();
    }
    _alreadyInit.value = true;
  }

  ///
  /// 일기 종류
  ///  1. 기분 또는 감정 -> 1
  ///  2. 오늘 하루중 -> 1
  ///  3. 주제 기록 -> 5
  /// 일기 쓰다가 이탈했을 경우, 종류는 위의 3가지중 하나이고, 일기가 같은 종류가 아닌 이상 여러가지일 경우는 없음
  /// + 일기 쓰다가 이탈했는지 여부를 알아야함.
  /// + 마지막 일기 종류
  /// + 앱 종료 후 재진입시 해당 페이지 접근해야함. <- 주차 넘어갔으면 procedure를 따라야함.
  ///

  final ValueNotifier<Map<int, String>> _rmData = ValueNotifier({});
  final ValueNotifier<String> _tedData = ValueNotifier('');
  final ValueNotifier<String> _tdData = ValueNotifier('');
  final ValueNotifier<DiaryType> _lastDiaryTypeData =
      ValueNotifier(DiaryType.none);
  final ValueNotifier<bool> _leaveDiaryData = ValueNotifier(false);
  final ValueNotifier<int> _diaryWeekData = ValueNotifier(0);
  final ValueNotifier<bool> diaryLoading = ValueNotifier(true);

  Map<int, String> get rmData => _rmData.value;

  String get tedData => _tedData.value;

  String get tdDAta => _tdData.value;

  DiaryType get lastDiaryType => _lastDiaryTypeData.value;

  bool get leaveDiary => _leaveDiaryData.value;

  int get diaryWeek => _diaryWeekData.value;

  ///
  /// diary 관련 init function
  ///
  void checkLeaveData(int currentWeek) async {
    diaryLoading.value = true;
    int week = await _checkDiaryWeek();
    if (currentWeek == week) {
      DiaryType type = await _checkDiaryType();
      if (type != DiaryType.none) {
        _getDiaryData(type);
        _leaveDiaryData.value = true;
        diaryLoading.value = false;
      } else {
        _leaveDiaryData.value = false;
        diaryLoading.value = false;
      }
    } else {
      _leaveDiaryData.value = false;
      diaryLoading.value = false;
    }
  }

  //마지막 프로세스의 다이어리 타입
  Future<DiaryType> _checkDiaryType() async {
    String? diaryType = _pref?.getString(LAST_DIARY_KEY);
    if (diaryType != null) {
      DiaryType type = DiaryTypeExtension.whichDiary(diaryType);
      _lastDiaryTypeData.value = type;
      return type;
    } else {
      return DiaryType.none;
    }
  }

  //다이어리 쓰고 있던 타입
  Future<int> _checkDiaryWeek() async {
    int week = _pref?.getInt(DIARY_WEEK_KEY) ?? 0;
    _diaryWeekData.value = week;
    return week;
  }

  //다이어리 데이터 가져오기
  void _getDiaryData(DiaryType type) {
    try {
      if (_pref != null) {
        switch (type) {
          case DiaryType.rm:
            Map<int, String> map = {};
            for (int idx = 1; idx < 6; idx++) {
              String? data = _pref?.getString('rm_key_$idx');
              if (data != null) {
                map[idx] = data;
              }
            }
            _rmData.value = map;
            break;
          case DiaryType.ted:
            _tedData.value = _pref?.getString(TED_KEY) ?? '';
            break;
          case DiaryType.td:
            _tdData.value = _pref?.getString(TD_KEY) ?? '';
            break;
          case DiaryType.none:
            break;
        }
      } else {
        throw Exception('SharedPreference is null');
      }
    } catch (e, s) {
      Log.e('Error : $e\nStackTrace : $s');
    }
  }

  Future<bool> saveAllRmData(Map<int, String> data) async {
    bool saveSuccess = true;
    if (data.isNotEmpty) {
      for (int week in data.keys) {
        bool? value = await _pref?.setString('rm_key_$week', data[week] ?? '');
        if (value == null || value == false) {
          saveSuccess = false;
        }
      }
    }
    return saveSuccess;
  }

  Future<bool> saveSingleRmData(int week, String data) async {
    String key = RM_KEY_1;
    switch (week) {
      case 5:
        key = RM_KEY_2;
        break;
      case 6:
        key = RM_KEY_3;
        break;
      case 7:
        key = RM_KEY_4;
        break;
      case 8:
        key = RM_KEY_5;
        break;
    }
    bool result = await _pref?.setString(key, data) ?? false;
    return result;
  }

  Future<bool> saveTedData(String data) async {
    return await _pref?.setString(TED_KEY, data) ?? false;
  }

  Future<bool> saveTdData(String data) async {
    return await _pref?.setString(TD_KEY, data) ?? false;
  }

  ///
  /// Onboarding
  ///
  final ValueNotifier<bool> _serviceOnboarding = ValueNotifier(false);
  final ValueNotifier<bool> _reportOnboarding = ValueNotifier(false);
  final ValueNotifier<bool> _rewardOnboarding = ValueNotifier(false);

  bool get showServiceOnboarding => _serviceOnboarding.value;

  bool get showReportOnboarding => _reportOnboarding.value;

  bool get rewardOnboarding => _rewardOnboarding.value;

  void initOnBoardingData() {
    _serviceOnboarding.value = _pref?.getBool(SHOW_SERVICE_ONBOARDING) ?? false;
    _reportOnboarding.value = _pref?.getBool(SHOW_REPORT_ONBOARDING) ?? false;
    _rewardOnboarding.value = _pref?.getBool(SHOW_REWARD_ONBOARDING) ?? false;
  }

  void saveServiceOnBoarding(bool value) {
    _serviceOnboarding.value = value;
    _pref?.setBool(SHOW_SERVICE_ONBOARDING, value);
  }

  void saveReportOnBoarding(bool value) {
    _reportOnboarding.value = value;
    _pref?.setBool(SHOW_REPORT_ONBOARDING, value);
  }

  void saveRewardOnBoarding(bool value) {
    _rewardOnboarding.value = value;
    _pref?.setBool(SHOW_REWARD_ONBOARDING, value);
  }

  ///
  /// Membership
  ///
  final ValueNotifier<String> _loginType = ValueNotifier('');
  final ValueNotifier<String> _userName = ValueNotifier('');

  String get loginType => _loginType.value;

  String get userName => _userName.value;

  void initMemberShip() {
    _loginType.value = _pref?.getString(LOGIN_TYPE) ?? '';
    _userName.value = _pref?.getString(USER_NAME_KEY) ?? '';
  }

  void saveLoginType(String value) {
    _loginType.value = value;
    _pref?.setString(LOGIN_TYPE, value);
  }

  void saveUserName(String value) {
    _userName.value = value;
    _pref?.setString(USER_NAME_KEY, value);
  }

  void clearMemberData() async {
    _loginType.value = '';
    await _pref?.remove(LOGIN_TYPE);
    _userName.value = '';
    await _pref?.remove(USER_NAME_KEY);
  }

  ///
  /// Sham 교육 퀴즈는 SP로 판단
  /// 교육 페이지에서 api 호출 후, 앱을 종료 후 다시 앱에 접근했을 때 퀴즈로 접근해야하기 때문에
  /// 퀴즈 관련 로컬 데이터가 하나 있어야함.
  /// 퀴즈 데이터가 null이면 퀴즈 페이지로 접근안해도 됨
  ///
  final ValueNotifier<int?> _quizData = ValueNotifier(null);

  int? get quiz => _quizData.value;

  void getQuizData() {
    _quizData.value = _pref?.getInt(QUIZ_KEY);
  }

  Future<void> saveQuizData(int? week) async {
    _quizData.value = week;
    if (week == null) {
      await _pref?.remove(QUIZ_KEY);
    } else {
      await _pref?.setInt(QUIZ_KEY, week);
    }
  }

  void clearQuiz() async {
    _quizData.value = null;
    await _pref?.remove(QUIZ_KEY);
  }

  ///
  /// 주차 -> week
  ///
  final ValueNotifier<int?> _currentWeek = ValueNotifier(null);

  int? get currentWeek => _currentWeek.value;

  Future<int?> getCurrentWeek() async {
    _currentWeek.value = _pref?.getInt(SERVICE_WEEK_KEY);
    return _currentWeek.value;
  }

  void saveCurrentWeek(int week) async {
    _currentWeek.value = week;
    _pref?.setInt(SERVICE_WEEK_KEY, week);
  }

  void clearCurrentWeek() async {
    _currentWeek.value = null;
    _pref?.remove(SERVICE_WEEK_KEY);
  }

  ///
  /// FCM Background
  ///
  final String BACKGROUND_FCM = 'BACKGROUND_FCM';
  final String SHAM_BACKGROUND_FCM = 'SHAM_BACKGROUND_FCM';

  @pragma('vm:entry-point')
  Future<bool?> checkBackgroundFCM({bool isSham = false}) async {
    _pref ??= await SharedPreferences.getInstance();
    return _pref?.getBool(isSham ? SHAM_BACKGROUND_FCM : BACKGROUND_FCM);
  }

  @pragma('vm:entry-point')
  void saveBackgroundFCM(bool input, {bool isSham = false}) async {
    _pref ??= await SharedPreferences.getInstance();
    await _pref?.setBool(isSham ? SHAM_BACKGROUND_FCM : BACKGROUND_FCM, input);
  }

  @pragma('vm:entry-point')
  void clearBackgroundFCM({bool isSham = false}) async {
    _pref ??= await SharedPreferences.getInstance();
    await _pref?.remove(isSham ? SHAM_BACKGROUND_FCM : BACKGROUND_FCM);
  }

  // static void insertFCMDataInStatic(String? fcmData)async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString('FCM_DATA', fcmData ?? '');
  // }
  // static Future<String?> readFCMDataInStatic()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString('FCM_DATA');
  // }
}
