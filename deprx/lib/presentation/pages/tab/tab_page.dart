import 'package:common/component/feature/tab/dp_bottom_navi.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../activity/activity_page.dart';
import '../home/home_page.dart';
import '../library/library_page.dart';
import '../mypage/my_page.dart';
import '../report/report_page.dart';

class TapPage extends StatefulWidget {
  final int idx;
  dynamic data = Get.arguments?['data'] as dynamic;

  TapPage({super.key, this.idx = 0});

  @override
  State<StatefulWidget> createState() => _TapPage();
}

class _TapPage extends State<TapPage> {
  final PageController _pageController = PageController();
  final ScreenUtil _screenUtil = ScreenUtil();

  int currentIdx = 0;

  late final List<Widget> _mainList = [
    const HomePage(),
    const ReportPage(),
    const LibraryPage(),
    const ActivityPage(),
    const MyPage()
  ];

  @override
  void initState() {
    if (Get.previousRoute == Routes.splash) {
      SplashUtil.preWord();
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.idx != 1) {
        if (mounted) {
          _pageController.jumpToPage(widget.idx);
          setState(() {
            currentIdx = widget.idx;
          });
        }
      }
    });
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
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        pageSnapping: false,
                        itemCount: _mainList.length,
                        onPageChanged: (idx) {
                          setState(() {
                            currentIdx = idx;
                          });
                        },
                        itemBuilder: (_, idx) {
                          return _mainList[idx];
                        })),
                BottomNavi(currentIdx: currentIdx, function: _pageMoveFunction)
              ],
            ),
          ),
        ));
  }

  void _pageMoveFunction(NavType data) {
    switch (data) {
      case NavType.home:
        GAUtil.trackEvent(
            name: GAEventList.BOTTOM_NAV_CLICK,
            params: {GAParameter.TAB_NAME: 'home'});
        _move(0);
        break;
      case NavType.report:
        GAUtil.trackEvent(
            name: GAEventList.BOTTOM_NAV_CLICK,
            params: {GAParameter.TAB_NAME: 'report'});
        _move(1);
        break;
      case NavType.document:
        GAUtil.trackEvent(
            name: GAEventList.BOTTOM_NAV_CLICK,
            params: {GAParameter.TAB_NAME: 'library'});
        _move(2);
        break;
      case NavType.activity:
        GAUtil.trackEvent(
            name: GAEventList.BOTTOM_NAV_CLICK,
            params: {GAParameter.TAB_NAME: 'activity'});
        _move(3);
        break;
      case NavType.profile:
        GAUtil.trackEvent(
            name: GAEventList.BOTTOM_NAV_CLICK,
            params: {GAParameter.TAB_NAME: 'mypage'});
        _move(4);
        break;
    }
  }

  void _move(int idx) {
    if (currentIdx != idx) {
      setState(() {
        currentIdx = idx;
      });
      _pageController.jumpToPage(idx);
    }
  }
}
