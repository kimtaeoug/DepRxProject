import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/mypage/mypage_controller.dart';

class MyAlarmPage extends StatefulWidget {
  MyAlarmPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyAlarmPage();
}

class _MyAlarmPage extends State<MyAlarmPage> with WidgetsBindingObserver {
  final ScreenUtil _screenUtil = ScreenUtil();
  final MyPageController _controller = Get.find();
  bool loading = true;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.myAlarm, isDeprx: false);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await permissionUtil.checkNotiPermission();
      _controller.initAvailableTime(successFunction: () {
        setState(() {
          loading = false;
        });
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await permissionUtil.checkNotiPermission();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final TextStyle _titleAlarmStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: Padding(
                    padding: EdgeInsets.only(top: _screenUtil.topPadding),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TitleAppBar(
                            title: 'common_settingAlarm'.tr,
                            needTopPadding: false,
                          ),
                          _alarmContainer(),
                          Container(
                            width: _screenUtil.width,
                            color: DColors.bgNormalAlternativeColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, bottom: 20, left: 24),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'alarm_overview_title'.tr,
                                      style: _titleAlarmStyle,
                                    ),
                                  ),
                                ),
                                _availableTime(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 68, bottom: 36),
                                  child: GetBuilder<MyPageController>(
                                      builder: (controller) {
                                    return DPbutton(
                                      text: 'common_ctaBtn_confirm'.tr,
                                      function: () {
                                        if (controller
                                            .availablePassCondition()) {
                                          controller.changeAvailableTime();
                                        }
                                      },
                                      isEnabled:
                                          controller.availablePassCondition(),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (loading) SmallLoadingFrame()
              ],
            ),
          ),
        ));
  }

  ///
  /// alarm
  ///

  final TextStyle _titleStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);
  final PermissionUtil permissionUtil = PermissionUtil();

  Widget _alarmContainer() {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: DColors.bgLightGray,
          border: Border(
              bottom:
                  BorderSide(color: DColors.lineAlternativeColor, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'alarm_toggleContainer_title'.tr,
            style: _titleStyle,
          ),
          Obx(() {
            return DPToggle(
              function: () {
                _controller.changeAllAlarm(!_controller.allAlarm.value);
              },
              isLeft: _controller.allAlarm.value,
            );
          })
          // ValueListenableBuilder(
          //     valueListenable: permissionUtil.notiPermisisonNotifier,
          //     builder: (context, value, child) {
          //       return DPToggle(
          //         function: () async {
          //           if (value) {
          //             await openAppSettings();
          //           } else {
          //             permissionUtil.requestNotiPermission(successFunction: () {
          //               permissionUtil.notiPermisisonNotifier.value = !value;
          //             }, failFunction: () async {
          //               await openAppSettings();
          //             });
          //           }
          //         },
          //         isLeft: !value,
          //       );
          //     })
        ],
      ),
    );
  }

  ///
  /// AvailableTime
  ///
  Widget _availableTime() {
    return GetBuilder<MyPageController>(builder: (controller) {
      return AvailableTime(
          itemClickFunction: (dayOfWeek, time) {
            controller.availableTimeFunction(dayOfWeek, time);
          },
          isSelected: controller.getAvailableListValue);
    });
  }
}
