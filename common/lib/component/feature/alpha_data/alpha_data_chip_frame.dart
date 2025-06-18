import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:common/common.dart';

class AlphaDataChipFrame extends StatelessWidget {
  final String title;
  final List<String> dataList;
  final Function() moveFunction;
  final String? strongTitle;
  final Map<String, dynamic> valueMap;
  final Function(String) addDataToMap;
  final Function(String) removeDataFromMap;
  final Function(String) setDataToMap;
  final Function() refreshMap;

  AlphaDataChipFrame(
      {super.key,
      required this.title,
      required this.dataList,
      required this.moveFunction,
      this.strongTitle,
        required this.valueMap,
        required this.addDataToMap,
        required this.removeDataFromMap,
        required this.setDataToMap,
        required this.refreshMap
      });

  // final AlphaDataController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DpTitle(
                    title: title,
                    strongTitle: strongTitle,
                    strongTitleColor: DColors.primaryNormalColor,
                    needPadding: false,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                _body()
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  width: _screenUtil.width,
                  color: DColors.transparent,
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 49, top: 74),
                  // padding: const EdgeInsets.only(bottom: 49, top: 15),
                  child: DPbutton(
                    text: 'common_ctaBtn_next'.tr,
                    function: () {
                      if (valueMap[title] != null &&
                          valueMap[title].isNotEmpty) {
                        moveFunction();
                      }
                    },
                    isEnabled:
                    valueMap[title] != null && valueMap[title].isNotEmpty,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      width: _screenUtil.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          spacing: (12 * _screenUtil.width) / 390,
          runSpacing: 16,
          children: List.generate(dataList.length, (idx) {
            String data = dataList[idx];
            return DPChip(
              text: data,
              function: () {
                if (valueMap[title] != null) {
                  if (valueMap[title].contains(data)) {
                    removeDataFromMap(data);
                    // _controller.valueMap[title].remove(data);
                  } else {
                    addDataToMap(data);
                    // _controller.valueMap[title].add(data);
                  }
                } else {
                  setDataToMap(data);
                  // _controller.valueMap[title] = [data];
                }
                refreshMap();
                // _controller.valueMap.refresh();
              },
              isCheck: valueMap[title] != null
                  ? valueMap[title].contains(data)
                  : false,
            );
          }),
        ),
      ),
    );
  }
}
