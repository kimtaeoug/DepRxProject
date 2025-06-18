import 'package:deprx/presentation/controllers/inspection/bdi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

@pragma('vm:entry-point')
class ProcedureService extends GetxService {
  final ProcedureUseCase useCase;

  ProcedureService(this.useCase);

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

  final AccessTokenUtil accessTokenUtil = AccessTokenUtil();
  RxBool _procedureLoading = false.obs;

  void getProcedure(
      {Function(ProcedureModel)? successFunction,
      Function()? failFunction,
      bool recursionFlag = true,
      Function()? loginFailFunction,
      bool force = true}) async {
    if (!_procedureLoading.value) {
      _procedureLoading.value = true;
      if (fcmToken.value == '') {
        fcmToken.value = await FCMHandler.getFCMToken() ?? '';
      }
      _loading.value = true;
      String? accessToken = await accessTokenUtil.initAccessToken();
      await useCase
          .getProcedure(accessToken ?? '', fcmToken.value, recursionFlag,
              successFunction: (response) async {
        _procedure.value = response;
        if (force) {
          _processSuccessFunction(response, successFunction: successFunction);
        } else {
          _procedureLoading.value = false;
        }
      }, failFunction: (error) {
        if (force) {
          _processFailFunction(error,
              loginFailFunction: loginFailFunction, failFunction: failFunction);
        } else {
          _procedureLoading.value = false;
        }
      });
    }
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

  //SY003

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
    _procedureLoading.value = false;
  }

  void _processFailFunction(dynamic error,
      {Function()? loginFailFunction, Function()? failFunction}) {
    if (error == useCase.loginFailException) {
      loginFailFunction?.call();
    } else {
      failFunction?.call();
    }
    _loading.value = false;
    _procedureLoading.value = false;
  }

  void setProcedure(ProcedureModel input) {
    checkStartBdiComplete.value = false;
    _prefUtil.saveCurrentWeek(input.week);
    _procedureFlow(input);
  }

  void clearProcedure() {
    _procedure.value = _defaultProcedure;
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
        SequenceTypeExtension.convertStringToSequenceType(sequence);
  }

  void setIsFinal(bool input) {
    _isFinal.value = input;
  }

  void makeSequence(int inputWeek, String sequence, {bool isFinal = false}) {
    List<SequenceType> weekData =
        SequenceTypeExtension.weekData(inputWeek, isFinal: isFinal);
    if (_sequence.isNotEmpty) {
      _sequence.clear();
    }
    SequenceType inputSequence =
        SequenceTypeExtension.convertStringToSequenceType(sequence);
    _currentSequence.value = inputSequence;
    _sequence.value = weekData.sublist(weekData.indexOf(inputSequence));
    _sequence.refresh();
  }

  final RxList<SequenceType> _sequence = <SequenceType>[].obs;
  final Rx<SequenceType> _currentSequence = SequenceType.none.obs;

  void move({bool passNextStep = false}) {
    if (startFinalBdi.value) {
      startFinalBdi.value = false;
      moveLetter();
    } else {
      if (_sequence.isNotEmpty) {
        if (passNextStep) {
          if (_sequence.length >= 2) {
            SequenceTypeExtension.move(_sequence[2], week);
            _sequence.removeAt(0);
            _sequence.removeAt(0);
          } else {
            SequenceTypeExtension.move(_sequence.last, week);
            _sequence.removeAt(0);
          }
        } else {
          SequenceTypeExtension.move(_sequence.first, week);
          _sequence.removeAt(0);
        }
      }
    }
  }

  void clearData() async {
    _procedure.value = _defaultProcedure;
    setIsFinal(false);
    accessTokenUtil.clearAccessToken();
    await Get.offAllNamed(Routes.socialLogin);
  }

  final RxBool startFinalBdi = false.obs;
  final PrefUtil _prefUtil = PrefUtil();
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
        startBDIFunction(isAppResumed: isAppResumed);
        break;
      case 'finishBdi':
        finishBDIFunction(isAppResumed: isAppResumed);
        break;
      case 'earlyEnd':
        earlyEndFunction(isAppResumed: isAppResumed);
        break;
    }
  }

  RxBool checkStartBdiComplete = false.obs;

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
      print("finishBDIFunction is invoked");
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

  @pragma('vm:entry-point')
  void moveLetter() {
    Get.offNamed(Routes.bdiFinalCompletePage);
  }
}
