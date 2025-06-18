import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class PhoneFrame extends StatefulWidget {
  final Function(bool) moveFunction;
  final bool isFromSummary;
  final String phoneValue;
  final String completePhoneValue;
  final bool Function(String) passCondition;
  final Function(String, Function()) certFunction;
  final bool isDeprx;

  const PhoneFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.phoneValue,
      required this.completePhoneValue,
      required this.passCondition,
      required this.certFunction,
      this.isDeprx = true});

  @override
  State<StatefulWidget> createState() => _PhoneFrame();
}

class _PhoneFrame extends State<PhoneFrame> {
  // final JoinController _controller = Get.find();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();
  String inputText = '';

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.phone, isDeprx: widget.isDeprx);
    _phoneController.addListener(_listener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _phoneFocusNode.requestFocus();
      if (widget.phoneValue.isNotEmpty) {
        if (widget.completePhoneValue.isNotEmpty) {
          if (mounted) {
            setState(() {
              _phoneController.text = widget.completePhoneValue;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _phoneController.text = widget.phoneValue;
            });
          }
        }
      }
    });
  }

  void _listener() {
    setState(() {
      inputText = _phoneController.text;
    });
  }

  @override
  void dispose() {
    _phoneController.removeListener(_listener);
    _phoneController.dispose();
    _phoneFocusNode.dispose();
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
          DpTitle(title: 'common_overview_title_phone'.tr),
          _phoneContainer(),
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
            isEnabled: widget.passCondition(inputText),
          )
        ],
      ),
    );
  }

  ///
  /// Phone Container
  ///
  Widget _phoneContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _phoneController,
        onChanged: (value) {
          // if (value != null) {
          //   _controller.phone.value = value;
          // }
        },
        focusNode: _phoneFocusNode,
        hintText: 'common_textfiled_hint_phone'.tr,
        onTap: () {
          _phoneFocusNode.requestFocus();
        },
        keyboardInputType: TextInputType.phone,
        inputFormat: [
          MaskedFormatter(masks: ['xxx-xxxx-xxxx'], separator: '-'),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]'))
        ],
        onSubmitted: (_) {
          _process();
        },
      ),
    );
  }

  void _process() {
    widget.certFunction(inputText, () {
      UIUtil.closeKeyBoard();
      widget.moveFunction.call(true);
    });
  }
}
