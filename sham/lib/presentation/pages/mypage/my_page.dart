import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../controllers/mypage/mypage_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  final MyPageController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.myPage, isDeprx: false);
    _controller.initReward();
    _controller.setTermModelData();
    _controller.getMarketing();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Padding(
              padding: EdgeInsets.only(top: _screenUtil.topPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: _screenUtil.topPadding,
                    ),
                    _header(),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (_controller.rewardLoading.value) {
                        return MyPageRewardSkeleton();
                      } else {
                        RxList<RewardModel> rewardList =
                            _controller.myPageRewardList;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child:
                              MyPageRewardContainer(dataList: rewardList.value),
                        );
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    _itemContainer(),
                    const SizedBox(
                      height: 33,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  ///
  /// header
  ///
  final TextStyle _headerStyle =
      DpTextStyle.h4.style.copyWith(color: DColors.black);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Obx(() {
          return Text(
            _controller.name.value,
            style: _headerStyle,
          );
        }),
      ),
    );
  }

  ///
  /// MyPage Item List
  ///
  final List<MyPageItemType> _itemList = MyPageItemType.values;

  List<Widget> _myPageItemWidgetList() {
    return _itemList.map((e) {
      if (e == MyPageItemType.marketing) {
        return Obx(() {
          return MarketingItem(
              isLeft: !_controller.marketingValue.value,
              function: () {
                if (_controller.marketingValue.value) {
                  _marketingDialog();
                } else {
                  _controller.changeMarketing(true);
                }
              });
        });
      } else {
        return MyPageItem(
          title: e.korean,
          function: () {
            Get.toNamed(e.route);
          },
        );
      }
    }).toList();
  }

  Widget _itemContainer() {
    return MyPageItemContainer(
      widgetList: _myPageItemWidgetList(),
      containerColor: DColors.white,
    );
  }

  final DPDialog dialog = DPDialog();
  final String _title = 'marketingDialog_title'.tr;
  final String _subTitle = 'marketingDialog_subtitle'.tr;

  void _marketingDialog() {
    dialog.showTitleWithSubtitle(_title, _subTitle, () {
      _controller.changeMarketing(false);
      Get.back();
    }, top: 13, bottom: 27);
  }
}
