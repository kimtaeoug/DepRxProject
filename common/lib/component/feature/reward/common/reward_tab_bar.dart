import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class RewardTabBar extends StatelessWidget {
  final int currentIdx;
  final Function(int) function;

  RewardTabBar({super.key, required this.currentIdx, required this.function});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _defaultStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _selectedStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.primaryNormalColor);

  final List<RewardType> _rewardList = RewardType.values;
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_rewardList.length, (idx) {
          RewardType type = _rewardList[idx];
          return _item(idx, type, isSelected: currentIdx == idx);
        }),
      ),
    );
  }

  Widget _item(int idx, RewardType type, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        function.call(idx);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: _screenUtil.duration300,
            width: _screenUtil.width / 4,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: DColors.transparent,
            child: Center(
              child: Text(
                type.label,
                style: isSelected ? _selectedStyle : _defaultStyle,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Container(
                  width: _screenUtil.width / 4,
                  height: 1,
                  color: DColors.lineNormalColor,
                ),
              ),
              AnimatedContainer(
                duration: _duration,
                width: _screenUtil.width / 4,
                height: isSelected ? 2 : 0,
                color: DColors.primaryNormalColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
