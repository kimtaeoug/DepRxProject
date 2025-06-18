import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/join/join_controller.dart';

class PersonalInfoPage extends StatefulWidget {
  final int? pageIdx = Get.arguments?['page'] as int?;
  final bool? isFromSummary = Get.arguments?['from_summary'] as bool?;
  final bool? isSocial = Get.arguments?['isSocial'] as bool?;

  PersonalInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _PersonalInfoPage();
}

class _PersonalInfoPage extends State<PersonalInfoPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final JoinController _jController = Get.find();

  int progressValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _frameList() => [
        Obx(() {
          return NameFrame(
            moveFunction: _move,
            isFromSummary: widget.isFromSummary ?? false,
            name: _jController.name.value,
            setEnoughLength: (value) {
              _jController.enoughNameLength.value = value;
            },
            setEnoughKoreanName: (value) {
              _jController.enoughKoreanName.value = value;
            },
            namePassCondition: (value) {
              return value.isNotEmpty &&
                  _jController.enoughKoreanName.value &&
                  _jController.enoughNameLength.value;
            },
            nameError: (!_jController.enoughKoreanName.value) ||
                (!_jController.enoughNameLength.value),
            setNameFunction: (value) {
              _jController.name.value = value;
            },
          );
        }),
        Obx(() {
          return PhoneFrame(
            moveFunction: _move,
            isFromSummary: widget.isFromSummary ?? false,
            phoneValue: _jController.phone.value,
            completePhoneValue: _jController.completePhone.value,
            passCondition: (value) => _jController.phonePassCondition(value),
            certFunction: (text, function) {
              _jController.certPhone(text, function);
            },
          );
        }),
        Obx(() {
          return PhoneAuthFrame(
            moveFunction: _move,
            isFromSummary: widget.isFromSummary ?? false,
            setPhoneAuth: (value) {
              _jController.phoneAuth.value = value;
            },
            certPhonePassCondition: (value) => value.length == 6,
            certPhone: (text, function) {
              _jController.certPhone(text, function);
            },
            phoneValue: _jController.phone.value,
            certPhoneConfirm: (function) {
              _jController.certPhoneConfirm(function);
            },
          );
        }),
        Obx(() {
          return BirthDateFrame(
            moveFunction: _move,
            isFromSummary: widget.isFromSummary ?? false,
            birth: _jController.birth.value,
            gender: _jController.gender.value,
            modifyBirth: _jController.modifyBirth.value,
            setGenderBirth: (gender, birth) {
              _jController.gender.value = gender;
              _jController.birth.value = birth;
              GAUtil.trackEvent(name: GAEventList.GENDER_SELECT, params: {
                GAParameter.GENDER:
                _jController.gender.value == 'M' ? 'male' : 'female'
              }, isDeprx: false);
            },
            setModifyBirth: (value) {
              _jController.modifyBirth.value = value;
            },
            birthPassCondition: (modifyBirth, gender) {
              return modifyBirth == true && gender != '';
            },
            standardDate: _jController.now,
          );
        }),
        AddressFrame(
          moveFunction: _move,
          isFromSummary: widget.isFromSummary ?? false,
          setAddressFunction: (value) {
            _jController.address.value = value;
          },
        ),
        Obx(() {
          return AddressDetailFrame(
            moveFunction: _move,
            isFromSummary: widget.isFromSummary ?? false,
            addressValue: _jController.address.value,
            detailAddressValue: _jController.detailAddress.value,
            detailAddressPassCondition: (value) {
              return value.isNotEmpty;
            },
            setDetailAndFixedAddress: (detailAddress, address) {
              _jController.detailAddress.value = detailAddress;
              _jController.fixedAddress.value = address;
            },
          );
        }),
      ];
  late final PageController _controller =
      PageController(initialPage: widget.pageIdx ?? 0);

  late int currentIdx = widget.pageIdx ?? 0;

  void _move(bool isForward, {bool noAnimation = false}) {
    if (isForward) {
      if (currentIdx != _frameList().length - 1) {
        currentIdx += 1;
        if (noAnimation) {
          _controller.jumpToPage(currentIdx);
        } else {
          _controller.animateToPage(currentIdx,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        }
      } else {
        Get.offNamed(Routes.signUpSummary,
            arguments: {'isSocial': widget.isSocial});
      }
    } else {
      if (widget.isFromSummary == true) {
        Get.back();
      } else {
        if (currentIdx != 0) {
          currentIdx--;
          _controller.animateToPage(currentIdx,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else {
          Get.back();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, obj) {
          if (!value) {
            _move(false);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _screenUtil.topPadding + 28,
                ),
                DPProgressBar(
                  value: currentIdx,
                  totalLength: _frameList().length,
                ),
                const SizedBox(
                  height: 10,
                ),
                BackAppBar(
                  needTopPadding: false,
                  needCloseKeyboard: true,
                  backFunction: () {
                    _move(false);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: SizedBox(
                  width: _screenUtil.width,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: _frameList(),
                    onPageChanged: (idx) {
                      setState(() {
                        currentIdx = idx;
                      });
                    },
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
