import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';

class ReadRmPage extends StatefulWidget {
  final int? week = Get.arguments?['data'] as int?;

  ReadRmPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReadRmPage();
}

class _ReadRmPage extends State<ReadRmPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryController _controller = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.readRm, isDeprx: false);
    _controller.getRmData(widget.week ?? 1);
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
              children: [BackAppBar(), _body()],
            ),
          ),
        ));
  }

  Widget _body() {
    if (widget.week != null) {
      return Obx(() {
        RxBool loading = _controller.rmLoading;
        if (loading.value) {
          return Expanded(child: LoadingFrame());
        } else {
          List<String> dataList =
              _controller.rmDataMap[widget.week ?? 1]?.answerList ?? [];
          List<RecognizeMeItemEntity> itemList =
              _controller.recogTitleMap[widget.week ?? 1]?.data ?? [];
          if (dataList.isEmpty) {
            return EmptyDiary();
          } else {
            return Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(dataList.length, (idx) {
                  String title = itemList[idx].title;
                  String content = dataList[idx];
                  return Padding(
                    padding: EdgeInsets.only(bottom: idx != dataList.length - 1 ? 20 : 61),
                    child: RecognizeMeItem(title: title, content: content),
                  );
                }),
              ),
            ));
          }
        }
      });
    } else {
      return EmptyDiary();
    }
  }
}
