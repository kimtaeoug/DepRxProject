import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../common/animation/dp_skeleton_container.dart';
import 'kbads_empty_container.dart';
import 'report_chart.dart';
import 'report_noti.dart';

class ReportKbadsItem extends StatefulWidget {
  final KBadsType type;
  final int week;
  final List<int?> value;

  const ReportKbadsItem(
      {super.key, required this.type, required this.week, required this.value});

  @override
  State<StatefulWidget> createState() => _ReportKbadsItem();
}

class _ReportKbadsItem extends State<ReportKbadsItem> {
  double _progressWidth = 232;
  late double _maxValue = widget.type.max;
  late double _minValue = 0;
  List<FlSpot> _spotList = [];
  List<int> unProceedList = [];
  bool _loading = true;
  double _cvPadding = 0;
  bool isCurrentValueNull = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double textWidth = UIUtil
          .widgetSize(_key)
          ?.width ?? 23;
      _makeSpotList(_screenUtil.width - 112 - textWidth * 2);
    });
  }

  void _makeSpotList(double progressWidth) {
    if (_loading) {
      double max = 0;
      double min = widget.type.max;
      List<FlSpot> spotList = [];
      List<int> unDidList = [];
      double cValue = 0;
      for (int idx = 0; idx < widget.value.length; idx++) {
        int? value = widget.value[idx];
        if (value == null) {
          unDidList.add(idx + 1);
        }
        double yValue = (value ?? 0).toDouble();
        if (yValue >= max) {
          max = yValue;
        }
        if (value != null) {
          if (min >= value) {
            min = value.toDouble();
          }
        }
        if (idx < widget.week && value != null) {
          spotList.add(FlSpot(idx.toDouble(), yValue));
        }
        if (idx == widget.week - 1) {
          cValue = yValue;
        }
      }
      double cvPadding = _convertValueToWidth(
          cValue, widget.type.max, progressWidth);
      setState(() {
        if (widget.value[widget.week - 1] == null) {
          isCurrentValueNull = true;
        }
        _minValue = min;
        _maxValue = max;
        _spotList = spotList;
        if (cvPadding > 0) {
          _cvPadding = cvPadding;
        }
        unProceedList = unDidList;
        _progressWidth = progressWidth;
        _loading = false;
      });
    }
  }

  final ScreenUtil _screenUtil = ScreenUtil();
  final KbadsUtil _kbadsUtil = KbadsUtil();

  final TextStyle _titleStyle =
  DpTextStyle.b1.style.copyWith(color: DColors.primaryNormalColor);
  final TextStyle _contentsStyle =
  DpTextStyle.b4.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _labelStyle =
  DpTextStyle.detail1.style.copyWith(color: DColors.labelAlternativeColor2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: _loading
          ? _skeleton()
          : Container(
        width: _screenUtil.width,
        margin: _screenUtil.defaultHorizontalMargin,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: DColors.white,
            boxShadow: _screenUtil.blue10Shadow(),
            borderRadius: _screenUtil.radius12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _screenUtil.width,
              child: Text(
                widget.type.titleWithNumber,
                style: _titleStyle,
              ),
            ),
            if (widget.week != 1 && _spotList.length != 1 &&
                unProceedList.contains(widget.week))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ReportNoti(
                  unproceededList: unProceedList,
                  currentWeek: widget.week,
                ),
              ),
            if (widget.week != 1 && _spotList.length != 1)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ReportChart(
                    type: widget.type,
                    week: widget.week.toDouble(),
                    max: _maxValue,
                    min: _minValue,
                    spots: _spotList),
              ),
            _bottomContainer()
          ],
        ),
      ),
    );
  }

  Widget _bottomContainer() {
    if (isCurrentValueNull) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: KbadsEmptyContainer(),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: _progressGraph(),
          ),
          SizedBox(
            width: _screenUtil.width,
            child: Text(
              _kbadsUtil.getDescription(
                  widget.type, widget.value, widget.week) ?? '',
              style: _contentsStyle,
            ),
          )
        ],
      );
    }
  }

  late final double min = widget.type.min;
  late final double max = widget.type.max;

  Widget _progressGraph() {
    return SizedBox(
      width: _screenUtil.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _progressGraphLabel(positive: false),
          SizedBox(
            width: _progressWidth,
            height: 24,
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:
                    List.generate(4, (idx) => _progressGraphItem(idx)),
                  ),
                ),
                Positioned(
                    left: widget.type == KBadsType.ac ? _cvPadding : null,
                    right: widget.type != KBadsType.ac ? _cvPadding : null,
                    child: _currentValue())
              ],
            ),
          ),
          _progressGraphLabel(positive: true)
        ],
      ),
    );
  }


  Widget _currentValue() {
    return Container(
      width: 4,
      height: 24,
      decoration: const BoxDecoration(
          color: DColors.red,
          borderRadius: BorderRadius.all(Radius.circular(100))),
    );
  }

  double _convertValueToWidth(double currentV, double max,
      double progressWidth) {
    if (widget.value.length >= widget.week) {
      if (currentV == max) {
        return (currentV / max * progressWidth) - 4;
      } else {
        return (currentV / max * progressWidth) - 2;
      }
    } else {
      return 0;
    }
  }


  Color _idxColor(int idx) {
    switch (idx) {
      case 0:
        return DColors.paletteBlue50;
      case 1:
        return DColors.paletteBlue200;
      case 2:
        return DColors.paletteBlue400;
      case 3:
        return DColors.primaryNormalColor;
      default:
        return DColors.primaryNormalColor;
    }
  }

  Widget _progressGraphItem(int idx) {
    return Container(
      width: _progressWidth / 4,
      height: 16,
      decoration: BoxDecoration(
          color: _idxColor(idx),
          borderRadius: BorderRadius.horizontal(
              left: idx == 0 ? const Radius.circular(12) : Radius.zero,
              right: idx == 3 ? const Radius.circular(12) : Radius.zero)),
    );
  }

  final GlobalKey _key = GlobalKey();

  Widget _progressGraphLabel({bool positive = true}) {
    return Padding(
      padding:
      EdgeInsets.only(right: !positive ? 16 : 0, left: positive ? 16 : 0),
      child: Text(
        key: positive ? _key : null,
        positive
            ? 'reportDetail_reportCard_positive'.tr
            : 'reportDetail_reportCard_negative'.tr,
        style: _labelStyle,
      ),
    );
  }

  Widget _skeleton() {
    return DPSkeletonContainer(
        width: _screenUtil.width, height: widget.week != 1 ? 365 : 183);
  }
}
