import 'package:common/common.dart';
import 'package:common/component/feature/find_id_pwd/find_id/find_id_social_frame.dart';
import 'package:core/core.dart';
import 'package:deprx/presentation/controllers/find_id_pwd/find_id_pwd_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class FindIdPage extends StatefulWidget {
  FindIdPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindIdPage();
}

class _FindIdPage extends State<FindIdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  int currentIdx = 0;
  final FindIdPwdController controller = Get.find();

  List<Widget> _frameList() => [
        Obx(() {
          return FindIdPhoneFrame(
            moveFunction: _move,
            idPhone: controller.idPhone.value,
            idPhonePassCondition: () => controller.idPhonePassCondition(),
            setIdPhone: (value) {
              controller.idPhone.value = value;
            },
            certPhoneInFindId: (function) {
              GAUtil.trackEvent(
                  name: GAEventList.PHONE_INPUT_SUBMIT,
                  params: {GAParameter.PHONE_NUMBER: controller.idPhone.value});
              controller.certPhoneInFindId(successFunction: function);
            },
          );
        }),
        Obx(() {
          return FindIdPhoneAuthFrame(
            moveFunction: _move,
            idPhoneAuth: controller.idPhoneAuth.value,
            idPhoneAuthPassCondition: () =>
                controller.idPhoneAuthPassCondition(),
            setIdPhoneAuth: (value) {
              controller.idPhoneAuth.value = value;
            },
            certPhoneInFindId: (function) {
              GAUtil.trackEvent(name: GAEventList.OTP_RESEND, params: {
                GAParameter.ATTEMP_COUNT:
                    controller.certPhoneInFindIdCount.value,
                GAParameter.PREVIOUS_SCREEN: 'findId'
              });
              controller.certPhoneInFindId(successFunction: function);
            },
            checkPhoneAuthInFindId: (function) {
              controller.checkPhoneAuthInFindId(successFunction: function);
            },
            findId: (function) {
              controller.findId(successFunction: function);
            },
            isDepRx: true,
          );
        }),
        Obx(() {
          RxString socialType = controller.findIdResultSocialType;
          if (socialType.value.isEmpty) {
            return FindIdResultFrame(
              moveFunction: _move,
              findIdResult: controller.findIdResult.value,
            );
          } else {
            return FindIdSocialFrame(
                moveFunction: _move, socialType: socialType.value);
          }
        })
      ];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.findId);
    controller.clearId();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            _move(isForward: false);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(() {
                  RxString socialType = controller.findIdResultSocialType;
                  return TitleAppBar(
                    title: 'common_findId'.tr,
                    backFunction: () {
                      _move(isForward: false);
                    },
                    notShowBack: socialType.value.isNotEmpty &&
                        currentIdx == _frameList().length - 1,
                    isDeprx: true,
                  );
                }),
                Expanded(
                    child: PageView.builder(
                        pageSnapping: false,
                        padEnds: false,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (idx) {
                          setState(() {
                            currentIdx = idx;
                          });
                        },
                        itemCount: _frameList().length,
                        itemBuilder: (context, idx) {
                          return _frameList()[idx];
                        }))
              ],
            ),
          ),
        ));
  }

  void _move({bool isForward = true}) {
    if (isForward) {
      if (currentIdx != _frameList().length - 1) {
        currentIdx += 1;
        _pageController.animateToPage(currentIdx,
            duration: _screenUtil.duration300, curve: Curves.linear);
      } else {
        GAUtil.trackEvent(name: GAEventList.FIND_ID_CONFIRM_CLICK, params: {
          GAParameter.BUTTON_NAME: 'confirm',
          GAParameter.SCREEN_NAME: Get.currentRoute
        });
        Get.back();
      }
    } else {
      if (currentIdx != 0) {
        if (currentIdx == _frameList().length - 1) {
          currentIdx = currentIdx - 2;
          _pageController.animateToPage(currentIdx,
              duration: _screenUtil.duration300, curve: Curves.linear);
          controller.idPhoneAuth.value = '';
        } else {
          currentIdx--;
          _pageController.animateToPage(currentIdx,
              duration: _screenUtil.duration300, curve: Curves.linear);
        }
      } else {
        GAUtil.trackEvent(name: GAEventList.OTP_PAGE_EXIT);
        Get.back();
      }
    }
  }
}
