import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class AttendanceProgressBar extends StatefulWidget {
  final int value;
  final int totalLength;

  AttendanceProgressBar(
      {super.key, required this.value, required this.totalLength});

  @override
  State<StatefulWidget> createState() => _AttendanceProgressBar();
}

class _AttendanceProgressBar extends State<AttendanceProgressBar> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.primaryNormalColor);

  final GlobalKey key = GlobalKey();
  double? progressWidth = null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Size? size = UIUtil.widgetSize(key);
      if (size != null) {
        setState(() {
          progressWidth = size.width;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: SizedBox(
          width: _screenUtil.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    key: key,
                    width: _screenUtil.width,
                    height: 4,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: DColors.lineNormalColor),
                  ),
                  Positioned(
                      left: 0,
                      child: AnimatedContainer(
                          width: widget.value == 0
                              ? 0
                              : widget.value /
                                  widget.totalLength *
                                  ((progressWidth ?? (_screenUtil.width - 66))),
                          height: 4,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: DColors.primaryNormalColor),
                          duration: const Duration(milliseconds: 100)))
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '${widget.value}/${widget.totalLength}',
                  style: _textStyle,
                ),
              )
            ],
          ),
        ));
  }
}
