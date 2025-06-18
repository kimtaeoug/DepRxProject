import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class AddressDetailFrame extends StatefulWidget {
  final Function(bool) moveFunction;
  final bool isFromSummary;
  final String addressValue;
  final String detailAddressValue;
  final bool Function(String) detailAddressPassCondition;
  final Function(String, String) setDetailAndFixedAddress;
  final bool isDeprx;

  const AddressDetailFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.addressValue,
      required this.detailAddressValue,
      required this.detailAddressPassCondition,
      required this.setDetailAndFixedAddress,
      this.isDeprx = true});

  @override
  State<StatefulWidget> createState() => _AddressDetailFrame();
}

class _AddressDetailFrame extends State<AddressDetailFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _defaultTextController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String _detailAddress = '';

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.userDetailAddress, isDeprx: widget.isDeprx);
    _textEditingController.addListener(_listener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
      _defaultTextController.text = widget.addressValue;
      if (widget.detailAddressValue.isNotEmpty) {
        _textEditingController.text = widget.detailAddressValue;
        _detailAddress = widget.detailAddressValue;
      }
    });
  }

  void _listener() {
    setState(() {
      _detailAddress = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_listener);
    _textEditingController.dispose();
    focusNode.dispose();
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
          DpTitle(title: 'userAddress_overview_title'.tr),
          DpSpacer(
            width: _screenUtil.width,
            height: 30,
            needKeyboardClose: true,
          ),
          _defaultAddressContainer(),
          const SizedBox(
            height: 16,
          ),
          _detailAddressContainer(),
          const SizedBox(
            height: 30,
          ),
          DPbutton(
            text: widget.isFromSummary ? 'common_edit'.tr: 'common_ctaBtn_next'.tr,
            function: () {
              _move();
            },
            isEnabled: widget.detailAddressPassCondition(_detailAddress),
          )
        ],
      ),
    );
  }

  void _move() {
    if (widget.detailAddressPassCondition(_detailAddress)) {
      UIUtil.closeKeyBoard();
      widget.setDetailAndFixedAddress(_detailAddress, widget.addressValue);
      if (widget.isFromSummary == true) {
        Get.back();
      } else {
        widget.moveFunction.call(true);
      }
    }
  }

  Widget _defaultAddressContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _defaultTextController,
        onChanged: (value) {},
        enabled: false,
      ),
    );
  }

  bool _alreadyEntered = false;

  Widget _detailAddressContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _textEditingController,
        focusNode: focusNode,
        onChanged: (value) {
          if (value != null) {
            if (!_alreadyEntered) {
              setState(() {
                _alreadyEntered = true;
              });
            }
          }
        },
        onTap: () {
          focusNode.requestFocus();
        },
        hintText: 'userDetailAddress_textfield_hint'.tr,
        onSubmitted: (_) {
          _move();
        },
        isError: _alreadyEntered == true && _detailAddress.isEmpty,
        errorText: 'userDetailAddress_overview_title'.tr,
      ),
    );
  }
}
