import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class ReportEmptyReward extends StatelessWidget {
  ReportEmptyReward({super.key});

  final TextStyle _textStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor3);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Resource.image('main_motion_007', width: 120, height: 120),
        const SizedBox(
          height: 20,
        ),
        Text(
          'common_emptyReward'.tr,
          style: _textStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
