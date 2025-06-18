import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:core/core.dart';
import 'package:deprx/presentation/controllers/deactivate/deactivate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class DeactivatePage extends StatefulWidget {
  DeactivatePage({super.key});

  @override
  State<StatefulWidget> createState() => _DeactivatePage();
}

class _DeactivatePage extends State<DeactivatePage> {
  final PageController pageController = PageController(initialPage: 0);
  final ScreenUtil _screenUtil = ScreenUtil();
  final DeactivateController _controller = Get.find();

  int _currentIdx = 0;

  late final List<Widget> _frameList = [
    Obx(() {
      return DeactivatePhoneFrame(
          moveFunction: _move,
          phone: _controller.phone.value,
          phonePassCondition: _controller.phonePassCondition,
          setPhone: (value) {
            _controller.phone.value = value;
          },
          certPhone: (function) {
            _controller.certPhone(successFunction: function);
          });
    }),
    Obx(() {
      return DeactivatePhoneAuthFrame(
          moveFunction: _move,
          phoneAuth: _controller.phoneAuth.value,
          phoneAuthPassCondition: _controller.phoneAuthPassCondition,
          setPhoneAuth: (value) {
            _controller.phoneAuth.value = value;
          },
          certPhone: (function) {
            _controller.certPhone(successFunction: function);
          },
          checkPhoneAuth: (function) {
            _controller.checkPhoneAuth(successFunction: function);
          });
    }),
    Obx(() {
      return DeactivateResultPwdFrame(
          id: _controller.id.value,
          moveToLogin: () {
            UIUtil.closeKeyBoard();
            Get.offAllNamed(Routes.baseLogin);
          },
          //Get.until((route) => Get.currentRoute == '/B');
          moveToResetPwd: () {
            UIUtil.closeKeyBoard();
            Get.toNamed(Routes.deactivateResetPwd);
          });
    })
  ];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.deactivate);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (_currentIdx != _frameList.length) {
            if (!value) {
              _move(isBack: true);
            }
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleAppBar(
                  title: 'deactivation_appBar_title'.tr,
                  notShowBack: _currentIdx == _frameList.length - 1,
                  backFunction: () {
                    _move(isBack: true);
                  },
                ),
                Expanded(
                    child: PageView.builder(
                        pageSnapping: false,
                        padEnds: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _frameList.length,
                        controller: pageController,
                        itemBuilder: (context, idx) {
                          return _frameList[idx];
                        }))
              ],
            ),
          ),
        ));
  }

  void _move({bool isBack = false}) {
    if (isBack) {
      if (_currentIdx > 0) {
        setState(() {
          _currentIdx -= 1;
        });
        _pageAnimation(_currentIdx);
      } else {
        UIUtil.closeKeyBoard();
        Get.back();
      }
    } else {
      if (_currentIdx != _frameList.length) {
        setState(() {
          _currentIdx += 1;
        });
        _pageAnimation(_currentIdx);
      }
    }
  }

  void _pageAnimation(int input) {
    pageController.animateToPage(input,
        duration: _screenUtil.duration300, curve: Curves.linear);
  }
}
