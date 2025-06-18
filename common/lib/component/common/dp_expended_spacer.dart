import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/colors.dart';

class DPExpendedSpacer extends StatelessWidget {
  final double width;

  const DPExpendedSpacer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        UIUtil.closeKeyBoard();
      },
      child: Container(
        width: width,
        color: DColors.transparent,
      ),
    ));
  }
}
