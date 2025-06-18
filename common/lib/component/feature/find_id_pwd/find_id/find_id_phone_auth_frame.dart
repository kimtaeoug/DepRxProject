import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class FindIdPhoneAuthFrame extends StatefulWidget {
  final Function() moveFunction;
  final String idPhoneAuth;
  final bool Function() idPhoneAuthPassCondition;
  final Function(String) setIdPhoneAuth;
  final Function(Function()) certPhoneInFindId;
  final Function(Function()) checkPhoneAuthInFindId;
  final Function(Function()) findId;
  final bool isDepRx;

  const FindIdPhoneAuthFrame({super.key,
    required this.moveFunction,
    required this.idPhoneAuth,
    required this.idPhoneAuthPassCondition,
    required this.setIdPhoneAuth,
    required this.certPhoneInFindId,
    required this.checkPhoneAuthInFindId,
    required this.findId,
    this.isDepRx = false});

  @override
  State<StatefulWidget> createState() => _FindIdPhoneAuthFrame();
}

class _FindIdPhoneAuthFrame extends State<FindIdPhoneAuthFrame>
    with WidgetsBindingObserver {
  // final FindIdPwdController _controller = Get.find();
  final TextEditingController _authController = TextEditingController();
  final FocusNode _authFocusNode = FocusNode();
  final ScreenUtil _screenUtil = ScreenUtil();
  final TimerUtil timerUtil = TimerUtil();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authFocusNode.requestFocus();
      if (widget.idPhoneAuth.isNotEmpty) {
        _authController.text = widget.idPhoneAuth;
      }
      timerUtil.startTimer();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      GALifeCycleHandler(
          state: state,
          gaFunction: (exitFromBack) {

          });

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timerUtil.cancelTimer();
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
            isEnabled: widget.idPhoneAuthPassCondition(),
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
                widget.setIdPhoneAuth(value);
              }
            },
            focusNode: _authFocusNode,
            hintText: 'common_textfiled_hint_sendCode'.tr,
            keyboardInputType: TextInputType.number,
            onSubmitted: (_) {
              _move();
            },
            suffixIcon: timerUtil.timerWidget(),
          ),
          const SizedBox(
            height: 16,
          ),
          timerUtil.resendContainer(_resendFunction),
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
        GAParameter.CONTEXT: 'findId'
      });
    }
    widget.certPhoneInFindId(() {
      timerUtil.cancelTimer();
      timerUtil.startTimer();
    });
  }

  void _move() {
    if (widget.idPhoneAuthPassCondition()) {
      widget.checkPhoneAuthInFindId(() {
        widget.findId(() {
          UIUtil.closeKeyBoard();
          widget.moveFunction.call();
        });
      });
    }
  }
}
