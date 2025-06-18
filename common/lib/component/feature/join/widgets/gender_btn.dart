import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class GenderBtn extends StatelessWidget {
  final String text;
  final Function() function;
  final bool isSelect;

  GenderBtn(
      {super.key,
      required this.text,
      required this.function,
      this.isSelect = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor);
  final TextStyle _selectStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.primaryNormalColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function.call();
      },
      child: Container(
        width: (_screenUtil.width - 64) / 2,
        height: 52,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: DColors.white,
            boxShadow: _screenUtil.emphasizeShadow()),
        child: Container(
          width: (_screenUtil.width - 64) / 2,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: isSelect
                ? DColors.primaryNormalColor.withOpacity(0.08)
                : DColors.white,
            border: Border.all(
                color: isSelect
                    ? DColors.primaryNormalColor
                    : DColors.transparent),
          ),
          child: Center(
            child: Text(
              text,
              style: isSelect ? _selectStyle : _textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
