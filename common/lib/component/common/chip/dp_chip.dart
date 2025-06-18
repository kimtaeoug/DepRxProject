import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DPChip extends StatelessWidget {
  final String text;
  final Function() function;
  final bool isCheck;


  const DPChip(
      {super.key,
      required this.text,
      required this.function,
      this.isCheck = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: ScreenUtil().radius20,
            color: isCheck ? DColors.primaryNormalColor : DColors.white),
        child: Text(
          text,
          style: DpTextStyle.b1.style
              .copyWith(color: isCheck ? DColors.white : DColors.black),
        ),
      ),
    );
  }
}
