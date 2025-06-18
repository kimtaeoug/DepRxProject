import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class FindIdPhoneFrame extends StatefulWidget {
  final Function() moveFunction;
  final String idPhone;
  final bool Function() idPhonePassCondition;
  final Function(String) setIdPhone;
  final Function(Function()) certPhoneInFindId;

  const FindIdPhoneFrame(
      {super.key,
      required this.moveFunction,
      required this.idPhone,
      required this.idPhonePassCondition,
      required this.setIdPhone,
      required this.certPhoneInFindId});

  @override
  State<StatefulWidget> createState() => _FindIdPhoneFrame();
}

class _FindIdPhoneFrame extends State<FindIdPhoneFrame> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _phoneFocusNode.requestFocus();
      if (widget.idPhone.isNotEmpty) {
        _phoneController.text = widget.idPhone;
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
              isEnabled: widget.idPhonePassCondition())
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
            widget.setIdPhone(value);
            // controller.idPhone.value = value;
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
    widget.certPhoneInFindId(() {
      UIUtil.closeKeyBoard();
      widget.moveFunction.call();
    });
  }
}
