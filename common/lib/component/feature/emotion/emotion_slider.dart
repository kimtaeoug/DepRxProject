import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class EmotionSlider extends StatefulWidget {
  final int currentValue;
  final Function(int) onChanged;
  final bool showArrow;
  final bool isActivity;

  EmotionSlider(
      {super.key,
      required this.currentValue,
      required this.onChanged,
      this.showArrow = true,
      this.isActivity = false});

  @override
  State<StatefulWidget> createState() => _EmotionSlider();
}

class _EmotionSlider extends State<EmotionSlider> {
  final ScreenUtil _screenUtil = ScreenUtil();
  late final TextStyle _currentState = DpTextStyle.h3.style.copyWith(
      color: widget.isActivity ? DColors.primaryNormalColor : DColors.white);
  late final TextStyle _labelStyle = DpTextStyle.b3.style.copyWith(
      color:
          widget.isActivity ? DColors.labelAlternativeColor2 : DColors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55),
      child: SizedBox(
        width: _screenUtil.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _whichStatus(widget.currentValue),
              style: _currentState,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: _screenUtil.width,
              height: 48,
              child: Stack(
                children: [
                  Container(
                    width: _screenUtil.width,
                    height: 48,
                    decoration: widget.isActivity
                        ? BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            gradient: DColors.activityEmotionSliderGradient)
                        : BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            color: DColors.white.withValues(alpha: 0.2),
                          ),
                  ),
                  if (widget.showArrow)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: SizedBox(
                        width: _screenUtil.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _arrowIcon(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: _arrowIcon(opacity: 0.5),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child:
                                        _arrowIcon(isLeft: false, opacity: 0.5),
                                  ),
                                  _arrowIcon(isLeft: false)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: _screenUtil.width,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(5, (idx) => _tapButton(idx)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      width: _screenUtil.width,
                      child: SliderTheme(
                          data: const SliderThemeData(
                              thumbColor: DColors.white,
                              inactiveTrackColor: DColors.transparent,
                              activeTrackColor: DColors.transparent,
                              activeTickMarkColor: DColors.transparent,
                              inactiveTickMarkColor: DColors.transparent,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 20)),
                          child: Slider(
                              min: 0,
                              max: 4,
                              value: widget.currentValue.toDouble(),
                              onChanged: (value) {
                                widget.onChanged(value.toInt());
                              })),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'common_status_worst'.tr,
                  style: _labelStyle,
                ),
                Text(
                  'common_status_best'.tr,
                  style: _labelStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _whichStatus(int idx) {
    switch (idx) {
      case 0:
        return 'common_status_worst'.tr;
      case 1:
        return 'common_status_bad'.tr;
      case 2:
        return 'common_status_normal'.tr;
      case 3:
        return 'common_status_good'.tr;
      case 4:
        return 'common_status_best'.tr;
      default:
        return '';
    }
  }

  Widget _tapButton(int idx) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(idx);
      },
      child: Container(
        width: TabletCheckUtil.check(_screenUtil, context) ? 65 : (_screenUtil.width - 110) / 6,
        height: 48,
        color: DColors.transparent,
      ),
    );
  }

  Widget _arrowIcon({bool isLeft = true, double opacity = 1}) {
    return Resource.icon('ic_arrow_${isLeft ? 'left' : 'right'}',
        width: 28,
        height: 28,
        colorFilter: ColorFilter.mode(
            DColors.white.withValues(alpha: opacity), BlendMode.srcIn));
  }
}
