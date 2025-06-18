import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class FindPwdPhoneAuthFrame extends StatefulWidget {
  final Function() moveFunction;
  final String pwdPhoneAuth;
  final bool Function() pwdPhoneAuthPassCondition;
  final Function(String) setPwdPhoneAuth;
  final Function(Function()) certPhoneInFindPwd;
  final Function(Function()) checkPhoneAuthInFindPwd;
  final bool isDepRx;
  const FindPwdPhoneAuthFrame({
    super.key,
    required this.moveFunction,
    required this.pwdPhoneAuth,
    required this.pwdPhoneAuthPassCondition,
    required this.setPwdPhoneAuth,
    required this.certPhoneInFindPwd,
    required this.checkPhoneAuthInFindPwd,
    this.isDepRx = false
  });

  @override
  State<StatefulWidget> createState() => _FindPwdPhoneAuthFrame();
}

class _FindPwdPhoneAuthFrame extends State<FindPwdPhoneAuthFrame> with WidgetsBindingObserver{
  final TextEditingController _authController = TextEditingController();
  final FocusNode _authFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();
  final TimerUtil _timerUtil = TimerUtil();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authFocusNode.requestFocus();
      if (widget.pwdPhoneAuth.isNotEmpty) {
        _authController.text = widget.pwdPhoneAuth;
      }
      _timerUtil.startTimer();
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => GALifeCycleHandler(state: state, gaFunction: (value){
    // GAUtil.trackEvent(name: GAEventList.OTP_PAGE_EXIT, params: {
    //   GAParameter.CONTEXT : 'findPwd',
    //   GAParameter.EXIT_REASON : value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
    // });
  });

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
            isEnabled: widget.pwdPhoneAuthPassCondition(),
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
                widget.setPwdPhoneAuth(value);
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
    if (widget.isDepRx) {
      count += 1;
      GAUtil.trackEvent(name: GAEventList.OTP_RESEND, params: {
        GAParameter.ATTEMP_COUNT: count,
        GAParameter.CONTEXT: 'findPwd'
      });
    }
    widget.certPhoneInFindPwd(() {
      _timerUtil.cancelTimer();
      _timerUtil.startTimer();
    });
  }

  void _move() {
    if (widget.pwdPhoneAuthPassCondition()) {
      widget.checkPhoneAuthInFindPwd(() {
        UIUtil.closeKeyBoard();
        widget.moveFunction.call();
      });
    }
  }
}
