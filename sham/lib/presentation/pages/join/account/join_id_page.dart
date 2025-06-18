import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../../controllers/join/join_controller.dart';

class JoinIdPage extends StatefulWidget {
  JoinIdPage({super.key});

  @override
  State<StatefulWidget> createState() => _JoinIdPage();
}

class _JoinIdPage extends State<JoinIdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Regex _regex = Regex();
  final JoinController controller = Get.find();

  final TextEditingController _idController = TextEditingController();
  final FocusNode _idFocusNode = FocusNode();

  @override
  void initState() {
    GAUtil.trackEvent(name: GAScreenList.signupId, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _idFocusNode.requestFocus();
      if (controller.idValue.value.isNotEmpty) {
        _idController.text = controller.idValue.value;
      }
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _idFocusNode.dispose();
    super.dispose();
  }

  final TextStyle _titleStyle =
      DpTextStyle.h5.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackAppBar(),
                  DpTitle(
                    title: 'signupId_appBar_title'.tr,
                    strongTitle: 'signupId_appBar_titleStrong'.tr,
                    strongTitleColor: DColors.primaryNormalColor,
                    inputTitleStyle: _titleStyle,
                  ),
                  _idContainer(),
                  const SizedBox(
                    height: 30,
                  ),
                  _joinBtn()
                ],
              ),
            ),
          ),
        ));
  }

  ///
  /// Id
  ///
  Widget _idContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<IdErrorType> type = controller.idErrorType;
        bool notError =
            type.value == IdErrorType.none || type.value == IdErrorType.pass;
        return DpTextInput(
          controller: _idController,
          onChanged: (value) {
            controller.checkIdValid(value, _regex);
            if (value != null) {
              if (value.contains(_regex.numberEnglishRegex)) {
                controller.idValue.value = value.toLowerCase();
              }
            }
          },
          label: 'common_textfield_label_id'.tr,
          hintText: 'common_textfield_hint_id'.tr,
          prefixIcon: _idPrefix(type: type.value),
          isError: !notError,
          prefixHeight: 24,
          focusNode: _idFocusNode,
          keyboardInputType: TextInputType.text,
          inputFormat: [
            FilteringTextInputFormatter.allow(_regex.numberEnglishRegex)
          ],
          maxLength: null,
          onTap: () {
            _idFocusNode.requestFocus();
          },
          errorWidget: controller.idErrorShowCondition()
              ? _idErrorText()
              : const SizedBox.shrink(),
          onSubmitted: (value) {
            _process();
          },
        );
      }),
    );
  }

  final TextStyle _errorDefaultStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);

  Widget _idErrorText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '${'common_textfield_error_id1'.tr}, ',
            style:
                !(_regex.checkLength(controller.idValue.value, min: 8, max: 20))
                    ? _errorStyle
                    : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id2'.tr}, ',
            style: !_regex.hasEn(controller.idValue.value)
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id3'.tr}',
            style: !(_regex.hasNumber(controller.idValue.value))
                ? _errorStyle
                : _errorDefaultStyle)
      ])),
    );
  }

  Widget _idPrefix({IdErrorType type = IdErrorType.none}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Resource.icon('ic_id',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(type.iconColor, BlendMode.srcIn)),
    );
  }

  ///
  /// Join Btn
  ///
  Widget _joinBtn() {
    return Obx(() {
      return DPbutton(
        text: 'common_ctaBtn_next'.tr,
        function: () {
          _process();
        },
        isEnabled: controller.idPassCondition(),
      );
    });
  }

  void _process() {
    if (controller.idPassCondition()) {
      controller.checkDuplicateId();
    }else{
      GAUtil.trackEvent(name: GAEventList.ID_INPUT_SUBMIT, params: {
        GAParameter.SUCCESS : 'false'
      }, isDeprx: false);
    }
  }
}
