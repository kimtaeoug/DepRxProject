import 'package:deprx/presentation/controllers/join/join_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class PersonalInfoResultPage extends StatefulWidget {
  final bool? isSocial = Get.arguments?['isSocial'] as bool?;

  PersonalInfoResultPage({super.key});

  @override
  State<StatefulWidget> createState() => _PersonalInfoResultPage();
}

class _PersonalInfoResultPage extends State<PersonalInfoResultPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final JoinController _controller = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.signUpDone);
    super.initState();
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
                        child: Obx(() {
                          RxString name = _controller.name;
                          RxString gender = _controller.gender;
                          Rx<DateTime> birth = _controller.birth;
                          RxString address = _controller.fixedAddress;
                          RxString detailAddress = _controller.detailAddress;
                          RxString phone = _controller.completePhone;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40 + _screenUtil.topPadding,
                              ),
                              DpTitle(title: 'userSummary_overview_title'.tr),
                              const SizedBox(
                                height: 32,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PersonalInfoResultItem(
                                    type: PersonalInfoType.name,
                                    function: () {
                                      _moveBack(0);
                                    },
                                    value: name.value),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PersonalInfoResultItem(
                                  type: PersonalInfoType.birth,
                                  function: () {
                                    _moveBack(3);
                                  },
                                  value: gender.value == 'M' ? '남성' : '여성',
                                  value2: TimeUtil.convertDateTo(birth.value,
                                      'yyyy${'activityMain_year'.tr} MM${'activityMain_month'.tr} dd${'activityMain_day'.tr}'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PersonalInfoResultItem(
                                    type: PersonalInfoType.address,
                                    function: () {
                                      _moveBack(4);
                                    },
                                    value:
                                        '${address.value} ${detailAddress.value}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PersonalInfoResultItem(
                                    type: PersonalInfoType.phone,
                                    function: () {
                                      _moveBack(1);
                                    },
                                    value: phone.value),
                              ),
                            ],
                          );
                        }),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Container(
                              width: _screenUtil.width,
                              color: DColors.transparent,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 62),
                              child: DPbutton(
                                  text: 'common_ctaBtn_next'.tr,
                                  function: () {
                                    if (!_controller.signUpLoading.value) {
                                      _completeSignUp(context);
                                    }
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  if (_controller.signUpLoading.value) {
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

  void _moveBack(int page) {
    Get.toNamed(Routes.signUpPersonalInfo, arguments: {
      'page': page,
      'from_summary': true,
      'isSocial': widget.isSocial
    });
  }

  void _completeSignUp(BuildContext context) {
    if (widget.isSocial == true) {
      _controller.socialSignUp();
    } else {
      _controller.signUp();
    }
  }
}
