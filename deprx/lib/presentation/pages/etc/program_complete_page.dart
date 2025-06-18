import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../../core/service/procedure_service.dart';

class ProgramCompletePage extends StatefulWidget {
  ProgramCompletePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProgramCompletePage();
}

class _ProgramCompletePage extends State<ProgramCompletePage>
    with SingleTickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();

  final String _title = 'programComplete_overview_title'.tr;
  final String _subTitle =
      'programComplete_overview_subTitle'.tr;

  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle = DpTextStyle.b1.style
      .copyWith(color: DColors.labelNeutralColor2, height: 1.6);

  late final AnimationController _controller = AnimationController(vsync: this);
  final ProcedureService service = Get.find();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.programComplete);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: _screenUtil.width,
                          child: Text(
                            _title,
                            style: _titleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        SizedBox(
                          width: _screenUtil.width,
                          child: Text(
                            _subTitle,
                            style: _subTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: SizedBox(
                        width: _screenUtil.width,
                        height: _screenUtil.width - 14,
                        child: Resource.lottiAnimationWithController(
                            'complete_animation', _controller,
                            width: 94, height: 94),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 53),
                  child: DPbutton(
                      text: 'common_ctaBtn_confirm'.tr,
                      function: () {
                        GAUtil.trackEvent(name: GAEventList.PROGRAM_COMPLETION_CONFIRM_BUTTON_CLICK, params: {
                          GAParameter.CLICK_TIME : DateTime.now()
                        });
                        service.move();
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
