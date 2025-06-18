import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmailLoginPage();
}

class _EmailLoginPage extends State<LoginPage> {
  final LoginController _controller = Get.find();
  final Regex _regex = Regex();
  final ScreenUtil _screenUtil = ScreenUtil();

  final FocusNode _idFocus = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.login, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_idFocus.canRequestFocus) {
        _idFocus.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    if(Get.previousRoute != Routes.baseLogin){
      UIUtil.closeKeyBoard();
    }
    _idController.dispose();
    _pwdController.dispose();
    _idFocus.dispose();
    _pwdFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: DColors.bgAlternativeColor,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      BackAppBar(
                        needCloseKeyboard: true,
                        backFunction: () {
                          UIUtil.closeKeyBoard();
                          Get.back();
                        },
                      ),
                      DpSpacer(
                        width: _screenUtil.width,
                        height: 20,
                        needKeyboardClose: true,
                      ),
                      _idContainer(),
                      DpSpacer(
                        width: _screenUtil.width,
                        height: 16,
                        needKeyboardClose: true,
                      ),
                      _pwdContainer(),
                      DpSpacer(
                        width: _screenUtil.width,
                        height: 16,
                        needKeyboardClose: true,
                      ),
                      _findIdAndPwd(),
                      DpSpacer(
                        width: _screenUtil.width,
                        height: 16,
                        needKeyboardClose: true,
                      ),
                      _loginBtn(),
                      DpSpacer(
                        width: _screenUtil.width,
                        height: 16,
                        needKeyboardClose: true,
                      ),
                      DpJoinText(
                        function: () async {
                          GAUtil.trackEvent(name: GAEventList.SIGN_UP_CLICK, isDeprx: false);
                          await Get.toNamed(Routes.auth);
                        },
                      )
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox(
                    width: _screenUtil.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Container(
                          width: _screenUtil.width,
                          color: DColors.transparent,
                        )),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 41),
                          child: DpCompanyLogo(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  ///
  /// Id
  ///
  final String _idHintText = 'common_textfield_hint_id'.tr;

  Widget _idContainer() {
    return Obx(() {
      Rx<IdErrorType> idType = _controller.idErrorType;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: DpTextInput(
          controller: _idController,
          onChanged: (value) {
            _controller.checkIdValid(value);
            if (value != null) {
              _controller.idInput.value = value.toLowerCase();
            }
          },
          keyboardInputType: TextInputType.text,
          isError: idType.value.value,
          prefixIcon: _prefixIcon(type: idType.value.statusType),
          prefixHeight: 24,
          inputFormat: [_regex.numberEnglishFormatter, _regex.noSpaceFormatter],
          hintText: _idHintText,
          label: 'common_textfield_label_id'.tr,
          errorText: idType.value.text,
          focusNode: _idFocus,
          maxLength: null,
          suffixHeight: 18,
          onTap: () {
            _idFocus.requestFocus();
          },
          onSubmitted: (value) {
            _pwdFocusNode.requestFocus();
          },
        ),
      );
    });
  }

  ///
  /// Pwd
  ///
  final String _pwdHintText = 'common_textfield_hint_pwd'.tr;

  Widget _pwdContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> pwdCondition = _controller.pwdErrorType;
        return DpTextInput(
          controller: _pwdController,
          onChanged: (value) {
            if (value != null) {
              _controller.pwdInput.value = value.toLowerCase();
              _controller.checkPwdValid(value);
            }
          },
          keyboardInputType: TextInputType.text,
          isError: pwdCondition.value.value,
          prefixIcon:
              _prefixIcon(isEmail: false, type: pwdCondition.value.statusType),
          prefixHeight: 24,
          inputFormat: [_regex.noSpaceFormatter],
          hintText: _pwdHintText,
          label: 'common_textfield_label_pwd'.tr,
          errorText: pwdCondition.value.text,
          focusNode: _pwdFocusNode,
          maxLength: null,
          isObscure: _controller.pwdObscure.value,
          suffixIcon:
              _controller.pwdInput.value.isNotEmpty ? _obscureIcon() : null,
          suffixHeight: 24,
          onTap: () {
            _pwdFocusNode.requestFocus();
          },
          onSubmitted: (value) {
            _process();
          },
        );
      }),
    );
  }

  ///
  /// Find Id and Pwd
  ///
  final TextStyle _findIdAndPwdStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);

  Widget _findIdAndPwd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: _screenUtil.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                UIUtil.closeKeyBoard();
              },
              child: Container(
                height: 25,
                color: DColors.transparent,
              ),
            )),
            _findIdPWdItem('common_findId'.tr, () {
              GAUtil.trackEvent(name: GAEventList.FIND_ID_CLICK, isDeprx: false);
              UIUtil.closeKeyBoard();
              Get.toNamed(Routes.findId);
            }),
            const SizedBox(
              width: 16,
            ),
            _findIdPWdItem('common_findPwd'.tr, () {
              GAUtil.trackEvent(name: GAEventList.FIND_PWD_CLICK, isDeprx: false);
              UIUtil.closeKeyBoard();
              Get.toNamed(Routes.findPwd);
            })
          ],
        ),
      ),
    );
  }

  Widget _findIdPWdItem(String text, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: DColors.bgBlueColor),
        child: Center(
          child: Text(
            text,
            style: _findIdAndPwdStyle,
          ),
        ),
      ),
    );
  }

  ///
  /// LoginBtn
  ///

  Widget _loginBtn() {
    return Obx(() {
      return DPbutton(
        text: 'common_btn_login'.tr,
        function: () {
          _process();
        },
        isEnabled: _controller.passCondition(),
      );
    });
  }

  ///
  /// Icons
  ///
  Widget _prefixIcon(
      {bool isEmail = true, ErrorStatusType type = ErrorStatusType.normal}) {
    return Resource.icon('ic_${isEmail ? 'id' : 'pwd'}',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(type.color, BlendMode.srcIn));
  }

  Widget _obscureIcon() {
    return Obx(() {
      RxBool obscure = _controller.pwdObscure;
      return ObscureButton(
          function: () {
            _controller.handlingObscure();
          },
          obscure: obscure.value);
    });
  }

  void _process() {
    if (_controller.passCondition()) {
      _controller.login();
    }
  }
}
