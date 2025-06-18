import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DpSpacer extends StatelessWidget {
  final double width;
  final double height;
  final bool needKeyboardClose;

  const DpSpacer({super.key,required this.width, required this.height, this.needKeyboardClose = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (needKeyboardClose) {
            UIUtil.closeKeyBoard();
          }
        },
        child: Container(
          width: width,
          height: height,
          color: DColors.transparent,
        ));
  }
}
