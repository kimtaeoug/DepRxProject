import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_spacer.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class NameFrame extends StatefulWidget {
  final Function(bool) moveFunction;
  final bool isFromSummary;
  final String name;
  final Function(bool) setEnoughLength;
  final Function(bool) setEnoughKoreanName;
  final bool Function(String) namePassCondition;
  final bool nameError;
  final Function(String) setNameFunction;
  final bool isDeprx;
  const NameFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.name,
      required this.setEnoughLength,
      required this.setEnoughKoreanName,
      required this.namePassCondition,
      required this.nameError,
      required this.setNameFunction,
      this.isDeprx = true});

  @override
  State<StatefulWidget> createState() => _NameFrame();
}

class _NameFrame extends State<NameFrame> {
  // final JoinController controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final Regex _regex = Regex();
  String inputText = '';

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.userName, isDeprx: widget.isDeprx);
    _textEditingController.addListener(_listener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
      if (widget.name.isNotEmpty) {
        setState(() {
          _textEditingController.text = widget.name;
          inputText = widget.name;
        });
        widget.setEnoughLength(enoughLength(inputText));
        widget.setEnoughKoreanName(koreanNameRegex(inputText));
      }
    });
  }

  void _listener() {
    setState(() {
      inputText = _textEditingController.text;
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
        mainAxisSize: MainAxisSize.max,
        children: [
          DpTitle(title: 'userName_overview_title'.tr),
          DpSpacer(
            width: _screenUtil.width,
            height: 30,
            needKeyboardClose: true,
          ),
          _nameContainer(),
          DpSpacer(
            width: _screenUtil.width,
            height: 30,
            needKeyboardClose: true,
          ),
          DPbutton(
            text: widget.isFromSummary ? 'common_edit'.tr : 'common_ctaBtn_next'.tr,
            function: () {
              _move();
            },
            isEnabled: widget.namePassCondition(inputText),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              UIUtil.closeKeyBoard();
            },
            child: Container(
              width: _screenUtil.width,
              color: DColors.transparent,
            ),
          ))
        ],
      ),
    );
  }

  Widget _nameContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _textEditingController,
        focusNode: focusNode,
        // inputFormat: [_regex.koreanFormatter],
        onChanged: (value) {
          if (value != null) {
            widget.setEnoughLength(enoughLength(value));
            widget.setEnoughKoreanName(koreanNameRegex(value));
            // controller.enoughNameLength.value = enoughLength(value);
            // controller.enoughKoreanName.value = koreanNameRegex(value);
          }
        },
        onTap: () {
          focusNode.requestFocus();
        },
        hintText: 'userName_textfield_hint_name'.tr,
        onSubmitted: (value) {
          _move();
        },
        errorText: _errorText,
        isError: inputText.isNotEmpty ? widget.nameError : false,
        // isError: inputText.isNotEmpty
        //     ? (!(controller.enoughKoreanName.value) ||
        //         !(controller.enoughNameLength.value))
        //     : false,
      ),
    );
  }

  bool enoughLength(String input) => input.length >= 2 && input.length <= 20;

  bool koreanNameRegex(String input) {
    List<String> splitted = input.split('');
    for (String data in splitted) {
      if (!_regex.isValidName(data)) {
        return false;
      }
    }
    return true;
  }

  final String _errorText = 'userName_textfield_error_name'.tr;
  final PrefUtil spUtil = PrefUtil();

  void _move() {
    if (widget.namePassCondition(inputText)) {
      if (widget.isFromSummary == true) {
        widget.setNameFunction(inputText);
        // controller.name.value = inputText;
        spUtil.saveUserName(inputText);
        UIUtil.closeKeyBoard();
        Get.back();
      } else {
        widget.setNameFunction(inputText);
        // controller.name.value = inputText;
        spUtil.saveUserName(inputText);
        UIUtil.closeKeyBoard();
        widget.moveFunction.call(true);
      }
    }
  }
}
