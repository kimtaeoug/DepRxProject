import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class AvailableTime extends StatelessWidget {
  final Function(DayOfWeekType, TimeRangeType) itemClickFunction;
  final bool Function(DayOfWeekType, TimeRangeType) isSelected;

  AvailableTime(
      {super.key, required this.itemClickFunction, required this.isSelected});

  final ScreenUtil _screenUtil = ScreenUtil();
  final List<DayOfWeekType> _dayOfWeekList = DayOfWeekType.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _labelContainer(),
        const SizedBox(
          height: 32,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(_dayOfWeekList.length, (idx) {
            return _dayOfWeek(_dayOfWeekList[idx], context);
          }),
        )
      ],
    );
  }

  ///
  /// label
  ///
  final TextStyle _labelPreStyle =
  DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);
  final TextStyle _labelSubStyle =
  DpTextStyle.b5.style.copyWith(color: DColors.labelNormalColor);

  final List<TimeRangeType> _timeList = TimeRangeTypeExtension.dataList();

  Widget _labelContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          color: DColors.white,
          border: Border.all(color: DColors.lineNeutralColor),
          borderRadius: _screenUtil.radius12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _labelContainerRow(TimeRangeType.dawn, TimeRangeType.am),
          const SizedBox(
            height: 4,
          ),
          _labelContainerRow(TimeRangeType.pm, TimeRangeType.dinner)
        ],
      ),
    );
  }

  Widget _labelContainerRow(TimeRangeType type1, TimeRangeType type2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _labelItem(type1),
        const SizedBox(
          width: 20,
        ),
        _labelItem(type2)
      ],
    );
  }

  Widget _labelItem(TimeRangeType type) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: '${type.korean} ', style: _labelPreStyle),
      TextSpan(text: type.detail, style: _labelSubStyle),
    ]));
  }

  ///
  /// time item
  ///
  final TextStyle _unSelectedStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.black);
  final TextStyle _selectedStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.white);

  Widget _timeTime(TimeRangeType type, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius8,
          color: isSelected ? DColors.primaryNormalColor : DColors.white),
      child: Text(
        type.korean,
        style: isSelected ? _selectedStyle : _unSelectedStyle,
      ),
    );
  }

  final TextStyle _dayOfWeekStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);

  Widget _dayOfWeekItem(String input) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        input,
        style: _dayOfWeekStyle,
      ),
    );
  }

  ///
  /// Day of Week
  ///

  Widget _dayOfWeek(DayOfWeekType dayOfWeek, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: _screenUtil.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: TabletCheckUtil.check(_screenUtil, context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _dayOfWeekItem(dayOfWeek.korean),
              const SizedBox(
                width: 20,
              ),
              TabletCheckUtil.check(_screenUtil, context) ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_timeList.length, (idx) {
                  TimeRangeType type = _timeList[idx];
                  return Padding(
                    padding: EdgeInsets.only(
                        right: idx != _timeList.length - 1 ? 16 : 0),
                    child: GestureDetector(
                      onTap: () {
                        itemClickFunction(dayOfWeek, type);
                      },
                      child: _timeTime(type,
                          isSelected: isSelected(dayOfWeek, type)),
                    ),
                  );
                }),
              ) : Expanded(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(_timeList.length, (idx) {
                        TimeRangeType type = _timeList[idx];
                        return FittedBox(
                          fit: BoxFit.cover,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: idx != _timeList.length - 1 ? 16 : 0),
                            child: GestureDetector(
                              onTap: () {
                                itemClickFunction(dayOfWeek, type);
                              },
                              child: _timeTime(type,
                                  isSelected: isSelected(dayOfWeek, type)),
                            ),
                          ),
                        );
                      }),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
