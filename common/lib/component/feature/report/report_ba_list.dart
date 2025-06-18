import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'report_ba_item_container.dart';
import 'package:api/api.dart';
class ReportBAList extends StatefulWidget {
  List<ReportBAItemModel> dataList;

  ReportBAList({super.key, required this.dataList});

  @override
  State<StatefulWidget> createState() => _ReportBAList();
}

class _ReportBAList extends State<ReportBAList> {
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    super.initState();
    draggableScrollableController.addListener(_listener);
  }

  @override
  void dispose() {
    draggableScrollableController.removeListener(_listener);
    draggableScrollableController.dispose();
    super.dispose();
  }

  void _listener() {
    if (draggableScrollableController.pixels <= 1) {
      Get.back();
      draggableScrollableController.removeListener(_listener);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: draggableScrollableController,
        initialChildSize: 0.75,
        minChildSize: 0.0,
        maxChildSize: 0.75,
        snap: true,
        expand: false,
        builder: (_, controller) {
          return Container(
            width: _screenUtil.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: DColors.bgLightGray),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(widget.dataList.length, (idx) {
                    ReportBAItemModel data = widget.dataList[idx];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 28, left: 1, right: 1),
                      child: ReportBAItemContainer(
                        dataList: data.baList,
                        header: data.dateLabel,
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        });
  }
}
