import 'package:common/common.dart';
import 'package:core/utils/timer_util.dart';
import 'package:core/utils/ui_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/colors.dart';
import 'package:resource/screen_util.dart';

class DeactivatePhoneAuthFrame extends StatefulWidget {
  final Function() moveFunction;
  final String phoneAuth;
  final bool Function() phoneAuthPassCondition;
  final Function(String) setPhoneAuth;
  final Function(Function()) certPhone;
  final Function(Function()) checkPhoneAuth;
  const DeactivatePhoneAuthFrame({
    super.key,
    required this.moveFunction,
    required this.phoneAuth,
    required this.phoneAuthPassCondition,
    required this.setPhoneAuth,
    required this.certPhone,
    required this.checkPhoneAuth,
  });

  @override
  State<StatefulWidget> createState() => _DeactivatePhoneAuthFrame();
}

class _DeactivatePhoneAuthFrame extends State<DeactivatePhoneAuthFrame>{
  final TextEditingController _authController = TextEditingController();
  final FocusNode _authFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();
  final TimerUtil _timerUtil = TimerUtil();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authFocusNode.requestFocus();
      if (widget.phoneAuth.isNotEmpty) {
        _authController.text = widget.phoneAuth;
      }
      _timerUtil.startTimer();
    });
  }

  @override
  void dispose() {
    _timerUtil.cancelTimer();
    _authController.dispose();
    _authFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      color: DColors.bgLightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DpTitle(title: 'common_overview_title_sendCode'.tr),
          _authNumberContainer(),
          DpSpacer(
            width: _screenUtil.width,
            height: 30,
            needKeyboardClose: true,
          ),
          DPbutton(
            text: 'common_ctaBtn_next'.tr,
            function: () {
              _move();
            },
            isEnabled: widget.phoneAuthPassCondition(),
          )
        ],
      ),
    );
  }

  ///
  /// Phone Auth Container
  ///
  Widget _authNumberContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DpTextInput(
            controller: _authController,
            onChanged: (value) {
              if (value != null) {
                widget.setPhoneAuth(value);
              }
            },
            focusNode: _authFocusNode,
            hintText: 'common_textfiled_hint_sendCode'.tr,
            keyboardInputType: TextInputType.number,
            onSubmitted: (_) {
              _move();
            },
            suffixIcon: _timerUtil.timerWidget(),
          ),
          const SizedBox(
            height: 16,
          ),
          _timerUtil.resendContainer(_resendFunction),
        ],
      ),
    );
  }

  int count = 0;
  void _resendFunction() {
    widget.certPhone(() {
      _timerUtil.cancelTimer();
      _timerUtil.startTimer();
    });
  }

  void _move() {
    if (widget.phoneAuthPassCondition()) {
      widget.checkPhoneAuth(() {
        UIUtil.closeKeyBoard();
        widget.moveFunction.call();
      });
    }
  }
}
