import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/activity/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivityCompletePage extends StatefulWidget {
  final String? activityId = Get.arguments?['data'] as String?;
  bool? fromHome = Get.arguments?['fromHome'] as bool?;

  ActivityCompletePage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityCompletePage();
}

class _ActivityCompletePage extends State<ActivityCompletePage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final ActivityController controller = Get.find();
  final String _yetTitle = 'baCompleteYet_overview_title'.tr;
  final String _allTitle = 'baComplete_overview_title'.tr;
  late final AnimationController _controller = AnimationController(vsync: this);
  final DateTime now = DateTime.now();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.activityComplete);
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
                    Text(
                      widget.activityId == null ? _allTitle : _yetTitle,
                      style: _titleStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: SizedBox(
                        width: _screenUtil.width,
                        height: _screenUtil.width - 14,
                        child: Resource.lottiAnimationWithController(
                          'complete_animation',
                          _controller,
                          width: 94,
                          height: 94,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 53),
                  child:
                      DPbutton(text: 'common_ctaBtn_yes'.tr, function: _move),
                )
              ],
            ),
          ),
        ));
  }

  void _move() {
    if (widget.activityId == null &&
        controller.week == 8 &&
        isSameDay(now, controller.endDate.value)) {
      controller.service.getProcedure(successFunction: (value) async {
        if (controller.service.isFinal) {
          await controller.resetMonth();
          controller.service.move();
        }else{
          controller.checkStamp(fromHome: widget.fromHome);
        }
      }, failFunction: () {
        ToastHandler().showExceptionError();
      });
      return;
    } else {
      controller.checkStamp(fromHome: widget.fromHome);
    }
    if (widget.activityId == null) {
      GAUtil.trackEvent(name: GAEventList.BA_COMPLETION_BUTTON_CLICK);
    } else {
      GAUtil.trackEvent(name: GAEventList.REMAINING_ACTIVITY_BUTTON_CLICK);
    }
  }
}
