import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/login/google_login_util.dart';
import '../../controllers/login/login_controller.dart';

class SocialLoginPage extends StatefulWidget {
  SocialLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _SocialLoginPage();
}

class _SocialLoginPage extends State<SocialLoginPage>
    with WidgetsBindingObserver {
  final LoginController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.socialLogin, isDeprx: false);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashUtil.preWord();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: _contents(),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: SizedBox(
                          width: _screenUtil.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                width: _screenUtil.width,
                                color: DColors.transparent,
                              )),
                              GestureDetector(
                                onTap: () {
                                  GAUtil.trackEvent(
                                      name: GAEventList.ID_LOGIN_CLICK,
                                      params: {GAParameter.LOGIN_METHOD: 'id'}, isDeprx: false);
                                  Get.toNamed(Routes.baseLogin);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 23),
                                  color: DColors.transparent,
                                  child: Text(
                                    'socialLogin_underlineBtn_idLogin'.tr,
                                    style: DpTextStyle.b1.style.copyWith(
                                      color: DColors.primaryNormalColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          DColors.primaryNormalColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40,
                                    bottom: 51 * _screenUtil.width / 390),
                                child: const DpCompanyLogo(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  if (_controller.socialLoginLoading.value) {
                    return SmallLoadingFrame();
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            ),
          ),
        ));
  }

  Widget _contents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _screenUtil.topPadding + (120 * _screenUtil.height / 793),
        ),
        Resource.image('ic_logo', width: 60, boxFit: BoxFit.fitWidth),
        const SizedBox(
          height: 80,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(_socialList().length, (idx) {
            SocialType type = _socialList()[idx];
            return Padding(
              padding: EdgeInsets.only(
                  bottom: idx == _socialList().length - 1
                      ? 68 * _screenUtil.width / 390
                      : 20),
              child: SocialItem(
                type: type,
                function: () {
                  _controller.socialLoginFunction(type);
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  List<SocialType> _socialList() {
    if (Platform.isAndroid) {
      return SocialType.values;
    } else {
      return SocialType.values;
    }
  }
}
