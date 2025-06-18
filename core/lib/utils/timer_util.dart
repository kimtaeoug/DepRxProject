import 'dart:async';
import 'package:core/utils/toast_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class TimerUtil {
  final Duration? goalDuration;

  TimerUtil({this.goalDuration});

  final Duration _defaultGoalDuration = const Duration(minutes: 3);
  final Duration _tickDuration = const Duration(seconds: 1);
  Timer? timer;
  final ValueNotifier<int> _time = ValueNotifier(0);

  void startTimer() {
    timer = Timer.periodic(_tickDuration, (tick) {
      if (timer != null) {
        _time.value = tick.tick;
        if (tick.tick == (goalDuration ?? _defaultGoalDuration).inSeconds) {
          _timeOverflowToast();
          cancelTimer();
        }
      }
    });
  }

  void _timeOverflowToast() {
    ToastHandler().show('common_toast_error_timeExpired'.tr, isError: true);
  }

  void cancelTimer() {
    timer?.cancel();
  }

  String convertTimeToString(int tick) {
    Duration lastTime = Duration(
        seconds: (goalDuration ?? _defaultGoalDuration).inSeconds - tick);
    int minute = lastTime.inMinutes;
    int second = lastTime.inSeconds - (lastTime.inMinutes * 60);
    return '${_twoDigit(minute)}:${_twoDigit(second)}';
  }

  String _twoDigit(int input) {
    if (input >= 10) {
      return input.toString();
    } else {
      return '0$input';
    }
  }

  ///
  /// Timer
  ///

  final TextStyle _timerStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.negativeStatusRed);

  Widget timerWidget() {
    return ValueListenableBuilder(
        valueListenable: _time,
        builder: (_, value, __) {
          return Text(
            convertTimeToString(value),
            style: _timerStyle,
          );
        });
  }

  ///
  /// resend
  ///
  final TextStyle _resendStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);

  Widget resendContainer(Function() function) {
    return GestureDetector(
      onTap: () {
        function();
        ToastHandler().show('common_toast_success_resending'.tr);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: DColors.bgBlueColor),
        child: Text(
          'common_chip_resending'.tr,
          style: _resendStyle,
        ),
      ),
    );
  }
}
