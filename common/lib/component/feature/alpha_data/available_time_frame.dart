import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../common/available_time.dart';
import '../../common/button/dp_button.dart';
import '../../common/dp_title.dart';

class AvailableTimeFrame extends StatefulWidget {
  final Function() moveFunction;
  final Function(DayOfWeekType, TimeRangeType) availableTimeFunction;
  final bool Function(DayOfWeekType, TimeRangeType) getAvailableListValue;
  final bool Function() availablePassCondition;
  final bool isDeprx;

  const AvailableTimeFrame(
      {super.key,
      required this.moveFunction,
      required this.availableTimeFunction,
      required this.getAvailableListValue,
      required this.availablePassCondition,
      this.isDeprx = false});

  @override
  State<StatefulWidget> createState() => _AvailableTimeFrame();
}

class _AvailableTimeFrame extends State<AvailableTimeFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final String _title = 'availableTime_overview_title'.tr;
  final String _subTitle = 'avaliableTime_overview_subtitle'.tr;

  @override
  void initState() {
    GAUtil.trackEvent(name: GAEventList.NOTIFICATION_SETTINGS_VIEW, params: {
      GAParameter.SCREEN_NAME : 'alarm',
      GAParameter.CONTEXT : 'signup'
    }, isDeprx: widget.isDeprx);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgAlternativeColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DpTitle(
                title: _title,
                subTitle: _subTitle,
                needPadding: false,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            AvailableTime(
                itemClickFunction: (dayOfWeek, time) {
                  if(widget.isDeprx){
                  }
                  widget.availableTimeFunction(dayOfWeek, time);
                },
                isSelected: widget.getAvailableListValue),
            const SizedBox(
              height: 32,
            ),
            //availablePassCondition
            Padding(
              padding: const EdgeInsets.only(bottom: 49),
              child: DPbutton(
                text: 'common_ctaBtn_next'.tr,
                function: () {
                  if (widget.availablePassCondition()) {
                    widget.moveFunction();
                  }
                },
                isEnabled: widget.availablePassCondition(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
