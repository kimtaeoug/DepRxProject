import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class MyMemberShipPage extends StatefulWidget {
  MyMemberShipPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyMemberShipPage();
}

class _MyMemberShipPage extends State<MyMemberShipPage> {
  final MyPageController _controller = Get.find();

  final DPDialog _dialog = DPDialog();

  List<Widget> _itemList(BuildContext context) =>
      MyMembershipType.values.map((e) {
        return MyPageItem(
            title: e.label,
            function: () {
              if (e == MyMembershipType.logout) {
                _dialog.showTitleWithSubtitle(
                    'logoutDialog_title'.tr, 'logoutDialog_subtitle'.tr, () {
                  _controller.logout();
                });
              } else {
                Get.toNamed(e.route);
              }
            });
      }).toList();

  List<Widget> _socialList(BuildContext context) => [
        MyPageItem(
            title: MyMembershipType.logout.label,
            function: () {
              _controller.logout();
            }),
        MyPageItem(
            title: MyMembershipType.leave.label,
            function: () async {
              await Get.toNamed(MyMembershipType.leave.route);
            })
      ];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.myMembership);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Obx(() {
          return Scaffold(
            backgroundColor: DColors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleAppBar(
                  title: 'common_userInfo'.tr,
                  isDeprx: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyPageItemContainer(
                    widgetList: _controller.loginType.value != ''
                        ? _socialList(context)
                        : _itemList(context))
              ],
            ),
          );
        }));
  }
}
