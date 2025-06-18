import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';

class ReadTdPage extends StatefulWidget {
  final DateTime? dateTime = Get.arguments?['data'] as DateTime?;

  ReadTdPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReadTdPage();
}

class _ReadTdPage extends State<ReadTdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryController _controller = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.readTodayDiary, isDeprx: false);
    _controller.getTdData(widget.dateTime ?? DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              mainAxisSize: MainAxisSize.min,
              children: [BackAppBar(), Expanded(child: _body())],
            ),
          ),
        ));
  }

  Widget _body() {
    if (widget.dateTime != null) {
      return Obx(() {
        RxBool loading = _controller.tdLoading;
        if (loading.value) {
          return LoadingFrame();
        } else {
          String timeData =
              TimeUtil.convertDateTo(widget.dateTime!, 'yyyy-MM-dd');
          return TodayDiaryItem(
              dateTime: widget.dateTime ?? DateTime.now(),
              contents: _controller.tdDataMap[timeData]?.contents ?? '');
        }
      });
    } else {
      return EmptyDiary();
    }
  }
}
