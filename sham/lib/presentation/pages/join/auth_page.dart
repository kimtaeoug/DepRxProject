import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/join/join_controller.dart';

class AuthPage extends StatefulWidget {
  final bool? isSocial = Get.arguments?['isSocial'] as bool?;

  AuthPage({super.key});

  @override
  State<StatefulWidget> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  final JoinController _controller = Get.find();
  final TextEditingController _textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.patientAuth, params: {
      'isSocial' : widget.isSocial ?? false
    }, isDeprx: false);
    UIUtil.closeKeyBoard();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BackAppBar(),
                        DpSpacer(
                          width: _screenUtil.width,
                          height: 28,
                          needKeyboardClose: true,
                        ),
                        DpTitle(
                          title: 'patientAuth_overview_title'.tr,
                          subTitle: 'patientAuth_overview_subTitle'.tr,
                        ),
                        DpSpacer(
                          width: _screenUtil.width,
                          height: 33,
                          needKeyboardClose: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: DpTextInput(
                            focusNode: focusNode,
                            controller: _textController,
                            label: 'patientAuth_textField_label'.tr,
                            hintText: 'patientAuth_textField_hint'.tr,
                            onChanged: (value) {
                              if (value != null) {
                                _controller.authValue.value = value;
                              }
                            },
                            onSubmitted: (value) {
                              _process();
                            },
                          ),
                        ),
                        DpSpacer(
                          width: _screenUtil.width,
                          height: 30,
                          needKeyboardClose: true,
                        ),
                        Obx(() {
                          return DPbutton(
                              text: 'common_ctaBtn_next'.tr,
                              function: () {
                                _process();
                              },
                              isEnabled:
                                  _controller.authPatientPassCondition());
                        })
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  RxBool loading = _controller.patientLoading;
                  if (loading.value) {
                    return SmallLoadingFrame();
                  } else {
                    return const SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ));
  }

  final DPDialog dpDialog = DPDialog();

  void _process() {
    GAUtil.trackEvent(
        name: GAEventList.AUTH_CODE_SUBMIT,
        params: {GAParameter.INPUT_VALUE: _controller.authValue.value}, isDeprx: false);
    if (_controller.authPatientPassCondition()) {
      _controller.authPatient(widget.isSocial, (hospital, rightFunction) {
        dpDialog.checkHospital(hospital, rightFunction);
      });
    }
  }
}
