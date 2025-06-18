import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:sham/presentation/controllers/inspection/bdi_controller.dart';

@pragma('vm:prefer-inline')
@pragma('vm:entry-point')
class ProcedureService extends GetxService {
  final ProcedureUseCase useCase;

  ProcedureService(this.useCase);

  final AccessTokenUtil accessTokenUtil = AccessTokenUtil();
  final ProcedureModel _defaultProcedure = const ProcedureModel();

  RxString fcmToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initFCMToken();
  }

  void initFCMToken() async {
    fcmToken.value = await FCMHandler.getFCMToken() ?? '';
  }

  late final Rx<ProcedureModel> _procedure = _defaultProcedure.obs;
  final GlobalKey<NavigatorState> contextKey = GlobalKey<NavigatorState>();

  final RxBool _loading = false.obs;
  final RxInt _week = 0.obs;
  final RxInt _round = 1.obs;
  final RxBool _isFinal = false.obs;

  bool get loading => _loading.value;

  int get week => _week.value;

  int get apiWeek => isFinal ? _week.value : _week.value - 1;

  int get round => _round.value;

  String get accessToken => accessTokenUtil.tokenValue;

  bool get isFinal => _isFinal.value;

  final RxList<ShamSequenceType> _sequence = <ShamSequenceType>[].obs;
  final Rx<ShamSequenceType> _currentSequence = ShamSequenceType.none.obs;
  final PrefUtil _prefUtil = PrefUtil();

  void move({bool passNextStep = false}) {
    if (startFinalBdi.value) {
      startFinalBdi.value = false;
      moveLetter();
    } else {
      if (_sequence.isNotEmpty) {
        if (_prefUtil.quiz != null) {
          Get.toNamed(Routes.quizPage, arguments: {'week': _prefUtil.quiz});
        } else {
          ShamSequenceTypeExtension.move(_sequence.first, week);
          _sequence.removeAt(0);
        }
      }
    }
  }

  void moveLetter() {
    Get.offNamed(Routes.bdiFinalCompletePage);
  }

  void makeSequence(int inputWeek, String sequence, {bool isFinal = false}) {
    List<ShamSequenceType> weekData =
        ShamSequenceTypeExtension.weekData(week, isFinal: isFinal);
    Log.e('weekData : $weekData');
    if (_sequence.isNotEmpty) {
      _sequence.clear();
    }
    ShamSequenceType inputSequence =
        ShamSequenceTypeExtension.convertStringToShamSequenceType(sequence);
    Log.e('inputSequence : $inputSequence');
    _currentSequence.value = inputSequence;
    _sequence.value = weekData.sublist(weekData.indexOf(inputSequence));
    _sequence.refresh();
  }

  void clearData() async {
    _procedure.value = _defaultProcedure;
    setIsFinal(false);
    accessTokenUtil.clearAccessToken();
    await Get.offAllNamed(Routes.socialLogin);
  }

  void getProcedure(
      {Function(ProcedureModel)? successFunction,
      Function()? failFunction,
      bool recursionFlag = true,
      Function()? loginFailFunction,
      bool force = true}) async {
    if (fcmToken.value == '') {
      fcmToken.value = await FCMHandler.getFCMToken() ?? '';
    }
    _loading.value = true;
    String? accessToken = await accessTokenUtil.initAccessToken();
    await useCase.getProcedure(accessToken ?? '', fcmToken.value, recursionFlag,
        successFunction: (response) {
      _procedure.value = response;
      if (force) {
        _processSuccessFunction(response, successFunction: successFunction);
      }
    }, failFunction: (error) {
      if (force) {
        _processFailFunction(error,
            loginFailFunction: loginFailFunction, failFunction: failFunction);
      }
    });
  }
  RxBool currentServerUpdate = false.obs;
  RxBool serverUpdateLoading = false.obs;

  void checkServerUpdate() async {
    if (!serverUpdateLoading.value) {
      currentServerUpdate.value = false;
      serverUpdateLoading.value = true;
      if (fcmToken.value == '') {
        fcmToken.value = await FCMHandler.getFCMToken() ?? '';
      }
      await useCase.updateProcedure(accessToken, fcmToken.value,
          successFunction: (value) {
            Log.e('value : $value');
            _procedure.value = value;
            currentServerUpdate.value = true;
            serverUpdateLoading.value = false;
          }, failFunction: (error) {
            if (error.errorCode == SERVER_UPDATE_CODE) {
              serverUpdateLoading.value = false;
              Future.delayed(const Duration(seconds: 10)).then((_) {
                checkServerUpdate();
              });
            } else {
              serverUpdateLoading.value = false;
              ToastHandler().showExceptionError();
            }
          });
    }
  }

  void moveInRefresh() {
    ProcedureModel data = _procedure.value;
    _prefUtil.saveCurrentWeek(data.week);
    if (accessToken == '') {
      accessTokenUtil.setAccessToken(data.accessToken);
    }
    _procedureFlow(data);
    move();
  }

  void _processSuccessFunction(ProcedureModel response,
      {Function(ProcedureModel)? successFunction}) {
    _prefUtil.saveCurrentWeek(response.week);
    if (accessToken == '') {
      accessTokenUtil.setAccessToken(response.accessToken);
    }
    _procedureFlow(response);
    if (successFunction != null) {
      successFunction(_procedure.value);
    }
    _loading.value = false;
  }

  void _processFailFunction(dynamic error,
      {Function()? loginFailFunction, Function()? failFunction}) {
    if (error == useCase.loginFailException) {
      loginFailFunction?.call();
      _loading.value = false;
    } else {
      failFunction?.call();
      _loading.value = false;
    }
  }

  void setIsFinal(bool input) {
    _isFinal.value = input;
  }

  void _procedureFlow(ProcedureModel data) {
    _procedure.value = data;
    _week.value = data.week;
    _round.value = data.round;
    accessTokenUtil.setAccessToken(data.accessToken);
    String sequence = data.sequence;
    bool isFinal = SequenceTypeExtension.isFinal(sequence);
    _isFinal.value = isFinal;
    makeSequence(data.week, sequence, isFinal: isFinal);
    _currentSequence.value =
        ShamSequenceTypeExtension.convertStringToShamSequenceType(sequence);
  }

  void clearProcedure() async {
    _procedure.value = _defaultProcedure;
    setIsFinal(false);
    accessTokenUtil.clearAccessToken();
    await Get.offAllNamed(Routes.socialLogin);
  }

  void setProcedure(ProcedureModel input) {
    checkStartBdiComplete.value = false;
    _prefUtil.saveCurrentWeek(input.week);
    _procedureFlow(input);
  }

  final RxBool startFinalBdi = false.obs;

  ///
  /// state 0 -> click
  /// state 1 -> auto
  ///
  final RxBool isJoinedFinalBDI = false.obs;

  ///
  /// state 0 -> click
  /// state 1 -> auto
  ///
  @pragma('vm:entry-point')
  void processFcm(String? data, {bool isAppResumed = false}) {
    ObjectBoxUtil().clearFcmData();
    switch (data) {
      case 'startBdi':
        startBDIFunction(isAppResumed : isAppResumed);
        break;
      case 'finishBdi':
        finishBDIFunction(isAppResumed : isAppResumed);
        break;
      case 'earlyEnd':
        earlyEndFunction(isAppResumed : isAppResumed);
        break;
    }
  }

  RxBool checkStartBdiComplete = false.obs;
  void setCheckStartBdiComplete(bool input){
    checkStartBdiComplete.value = input;
  }
  @pragma('vm:entry-point')
  void startBDIFunction({bool isAppResumed = false}) {
    if (!checkStartBdiComplete.value) {
      if (Get.isRegistered<BDIController>()) {
        Get.find<BDIController>().bdiComplete.value = true;
        checkStartBdiComplete.value = true;
      }
    }
  }

  @pragma('vm:entry-point')
  void finishBDIFunction({bool isAppResumed = false}) {
    if (!isJoinedFinalBDI.value && !startFinalBdi.value) {
      startFinalBdi.value = true;
      if(!isAppResumed){
        move();
      }
    }
  }

  final RxBool _alreadyCallFunction = false.obs;

  @pragma('vm:entry-point')
  void earlyEndFunction({bool isAppResumed = false}) {
    Log.e('earlyEndFunction is invoked');
    if (!_alreadyCallFunction.value) {
      _alreadyCallFunction.value = true;
      getProcedure(
          successFunction: (response) {
            _alreadyCallFunction.value = false;
            if(!isAppResumed){
              move();
            }
          },
          failFunction: () {
            _alreadyCallFunction.value = false;
            ToastHandler().showExceptionError();
          },
          recursionFlag: true);
    }
  }
}
