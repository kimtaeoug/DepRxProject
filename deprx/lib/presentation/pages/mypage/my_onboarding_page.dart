import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class MyOnBoardingPage extends StatefulWidget {
  MyOnBoardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyOnBoardingPage();
}

class _MyOnBoardingPage extends State<MyOnBoardingPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final List<OnBoardingType> _onboardingList = OnBoardingType.values;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.onboardingList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleAppBar(
                  title: 'userGuide_appBar_title'.tr,
                  isDeprx: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(_onboardingList.length, (idx) {
                    OnBoardingType type = _onboardingList[idx];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          type.function();
                        },
                        child: _item(type.title),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }

  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  Widget _item(String text) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: DColors.white,
          border: Border.all(width: 1, color: DColors.grayColor),
          boxShadow: _screenUtil.blue10Shadow()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: _titleStyle,
          ),
          Resource.icon('ic_arrow_right_blue',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                  DColors.labelNormalColor, BlendMode.srcIn))
        ],
      ),
    );
  }
}
