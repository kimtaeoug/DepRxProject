import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DpTabBar extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool isLeft;
  final Function() function;
  final Color itemColor;

  DpTabBar(
      {super.key,
      required this.leftText,
      required this.rightText,
      this.isLeft = true,
      required this.function,
      this.itemColor = DColors.bgAlternativeColor});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [_item(leftText), _item(rightText)],
          ),
          AnimatedAlign(
            alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
            duration: _screenUtil.duration200,
            child: _item(isLeft ? leftText : rightText, isSelect: true),
          )
        ],
      ),
    );
  }

  final TextStyle _selectStyle = DpTextStyle.b1.style.copyWith(
    color: DColors.primaryNormalColor,
  );
  final TextStyle _unSelectStyle = DpTextStyle.b1.style.copyWith(
      fontWeight: FontWeight.w500, color: DColors.labelAlternativeColor);

  Widget _item(String text, {bool isSelect = false}) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: _screenUtil.width / 2,
        padding: isSelect
            ? const EdgeInsets.only(top: 12, bottom: 11)
            : const EdgeInsets.symmetric(vertical: 12),
        decoration: !isSelect
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: DColors.lineAlternativeColor, width: 1)))
            : BoxDecoration(
                color: itemColor,
                border: const Border(
                    bottom: BorderSide(
                        color: DColors.primaryNormalColor, width: 2))),
        child: Center(
          child: Text(
            text,
            style: isSelect ? _selectStyle : _unSelectStyle,
          ),
        ),
      ),
    );
  }
}
