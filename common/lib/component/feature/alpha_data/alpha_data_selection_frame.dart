import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import '../../common/answer_container.dart';
import '../../common/dp_title.dart';

class AlphaDataSelectionFrame extends StatelessWidget {
  final String title;
  final List<String> dataList;
  final Function() moveFunction;
  final String? strongTitle;
  final bool moveLoading;
  final Function(bool) setMoveLoading;
  final Map<String, dynamic> valueMap;
  final Function(String) setValueMap;

  AlphaDataSelectionFrame(
      {super.key,
      required this.title,
      required this.dataList,
      required this.moveFunction,
      this.strongTitle,
      required this.moveLoading,
      required this.setMoveLoading,
      required this.valueMap,
      required this.setValueMap});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
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
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(dataList.length, (idx) {
          String data = dataList[idx];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AnswerContainer(
              text: data,
              function: () {
                if (!moveLoading) {
                  setMoveLoading(true);
                  setValueMap(data);
                  Future.delayed(const Duration(milliseconds: 100)).then((_) {
                    moveFunction();
                  });
                }
              },
              isCheck: valueMap[title] == data,
            ),
          );
        }),
      ),
    );
  }
}
