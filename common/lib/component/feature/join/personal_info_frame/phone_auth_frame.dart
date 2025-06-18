import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class PhoneAuthFrame extends StatefulWidget {
  final Function(bool) moveFunction;
  final bool isFromSummary;
  final Function(String) setPhoneAuth;
  final bool Function(String) certPhonePassCondition;
  final Function(String, Function()) certPhone;
  final String phoneValue;
  final Function(Function()) certPhoneConfirm;
  final bool isDeprx;

  const PhoneAuthFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.setPhoneAuth,
      required this.certPhonePassCondition,
      required this.certPhone,
      required this.phoneValue,
      required this.certPhoneConfirm,
      this.isDeprx = false});

  @override
  State<StatefulWidget> createState() => _PhoneAuthFrame();
}

class _PhoneAuthFrame extends State<PhoneAuthFrame>
    with WidgetsBindingObserver {
  final TextEditingController _authController = TextEditingController();
  final FocusNode _authFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();
  final TimerUtil _timerUtil = TimerUtil();

  String _phoneValue = '';

  @override
  void initState() {
    GAUtil.logScreen(
        screenName: GAScreenList.authPhone, isDeprx: widget.isDeprx);
    WidgetsBinding.instance.addObserver(this);
    _authController.addListener(_listener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authFocusNode.requestFocus();
      if (widget.isFromSummary == true) {
        _authController.text = '';
        widget.setPhoneAuth('');
      } else {
        _authController.text = '';
        widget.setPhoneAuth('');
      }
      _timerUtil.startTimer();
    });
  }

  void _listener() {
    setState(() {
      _phoneValue = _authController.text;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      GALifeCycleHandler(
          state: state,
          gaFunction: (value) {
            // if (widget.isDeprx) {
            //   GAUtil.trackEvent(name: GAEvent.OTP_PAGE_EXIT, params: {
            //     GAParameter.CONTEXT: 'signup',
            //     GAParameter.EXIT_REASON:
            //         value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
            //   });
            // }
          });

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _authController.removeListener(_listener);
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
              _process();
            },
            isEnabled: widget.certPhonePassCondition(_phoneValue),
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
              _process();
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
    count += 1;
    GAUtil.trackEvent(
        name: GAEventList.OTP_RESEND,
        params: {
          GAParameter.ATTEMP_COUNT: count,
          GAParameter.CONTEXT: 'signup'
        },
        isDeprx: widget.isDeprx);

    widget.certPhone(widget.phoneValue, () {
      _timerUtil.cancelTimer();
      _timerUtil.startTimer();
    });
  }

  void _process() {
    if (widget.certPhonePassCondition(_phoneValue)) {
      widget.certPhoneConfirm(() {
        UIUtil.closeKeyBoard();
        if (widget.isFromSummary == true) {
          Get.back();
        } else {
          widget.moveFunction.call(true);
        }
      });
    }
  }
}
