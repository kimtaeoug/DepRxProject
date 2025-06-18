import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class ReportNoti extends StatelessWidget {
  final List<int> unproceededList;
  final int currentWeek;

  ReportNoti(
      {super.key, required this.unproceededList, required this.currentWeek});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.negativeStatusRed);
  final String _contentsPrefix = 'reportDetail_reportCard_bannerPrefix'.tr;
  final String _contentsSubfix = 'reportDetail_reportCard_bannerSubfix'.tr;

  @override
  Widget build(BuildContext context) {
    String list = _makeListToString(unproceededList, currentWeek);
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius8,
          color: DColors.negativeStatusRed.withValues(alpha: 0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Resource.icon('ic_noti',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                  DColors.negativeStatusRed, BlendMode.srcIn)),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            _contentsPrefix + list + _contentsSubfix,
            style: _textStyle,
          ))
        ],
      ),
    );
  }

  String _makeListToString(List<int> input, int currentWeek) {
    List<String> result = [];
    if (input.contains(currentWeek)) {
      for (int idx = 0; idx < input.length; idx++) {
        int data = input[idx];
        if (data <= currentWeek) {
          result.add('$data${data != currentWeek ? ',' : ''}');
        }
      }
      if (result.last.contains(',')) {
        result.last = result.last.replaceAll(',', '');
      }
      return result.join();
    } else {
      return '';
    }
  }
}
