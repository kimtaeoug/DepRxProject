import 'package:common/common.dart';
import 'package:core/regex/masked_formatter.dart';
import 'package:core/utils/ui_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resource/colors.dart';
import 'package:resource/screen_util.dart';

class DeactivatePhoneFrame extends StatefulWidget {
  final Function() moveFunction;
  final String phone;
  final bool Function() phonePassCondition;
  final Function(String) setPhone;
  final Function(Function()) certPhone;

  const DeactivatePhoneFrame({
    super.key,
    required this.moveFunction,
    required this.phone,
    required this.phonePassCondition,
    required this.setPhone,
    required this.certPhone,
  });

  @override
  State<StatefulWidget> createState() => _DeactivatePhoneFrame();
}

class _DeactivatePhoneFrame extends State<DeactivatePhoneFrame> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _phoneFocusNode.requestFocus();
      if (widget.phone.isNotEmpty) {
        _phoneController.text = widget.phone;
      }
    });
  }

  @override
  void dispose() {
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
              text: 'common_ctaBtn_sendCode'.tr,
              function: () {
                _move();
              },
              isEnabled: widget.phonePassCondition())
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
          if (value != null) {
            widget.setPhone(value);
            // controller.pwdPhone.value = value;
          }
        },
        focusNode: _phoneFocusNode,
        hintText: 'common_textfiled_hint_phone'.tr,
        onTap: () {
          _phoneFocusNode.requestFocus();
        },
        keyboardInputType: TextInputType.phone,
        inputFormat: [
          MaskedFormatter(masks: ['xxx-xxxx-xxxx'], separator: '-')
        ],
        onSubmitted: (_) {
          _move();
        },
      ),
    );
  }

  void _move() {
    widget.certPhone(() {
      UIUtil.closeKeyBoard();
      widget.moveFunction.call();
    });
  }
}