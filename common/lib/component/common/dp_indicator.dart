import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
class DPIndicator extends StatelessWidget {
  final int currentIdx;
  final int totalLength;

  const DPIndicator(
      {super.key, required this.currentIdx, required this.totalLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(totalLength, (idx) {
        return Padding(
          padding: EdgeInsets.only(right: idx != totalLength - 1 ? 8 : 0),
          child: _dot(currentIdx == idx),
        );
      }),
    );
  }

  Widget _dot(bool isSelected) {
    return AnimatedContainer(
        width: isSelected ? 20 : 8,
        height: 8,
        duration: ScreenUtil().duration100,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(isSelected ? 4 : 100)),
            color: isSelected
                ? DColors.primaryNormalColor
                : DColors.gray800Color));
  }
}
