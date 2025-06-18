import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ReportChart extends StatefulWidget{
  final KBadsType type;
  final double week;
  final double max;
  final double min;
  final List<FlSpot> spots;
  ReportChart({super.key,
    required this.type,
    required this.week,
    required this.max,
    required this.min,
    required this.spots});


  @override
  State<StatefulWidget> createState() => _ReportChart();

}
//

class _ReportChart extends State<ReportChart> {
  bool loading = true;

  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }
  
  
  
  List<double> _function(){
    double min = 0;
    double max = 0;
    for(int idx = 0; idx < widget.spots.length; idx++){
      FlSpot spot = widget.spots[idx];
      if(max < spot.y){
        max = spot.y;
      }
      if(idx == 0){
        min = spot.y;
        max = spot.y;
      }else{
        if(min > spot.y){
          min = spot.y;
        }
        if(max < spot.y){
          max = spot.y;
        }
      }
    }
    return [min, max];
  }

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
  DpTextStyle.detail1.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: _screenUtil.width,
            child: Text(
              'reportDetail_reportCard_chartLabel'.tr,
              style: _titleStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: _screenUtil.width,
            child: AspectRatio(
              aspectRatio: 2.65,
              child: LineChart(mainData()),
            ),
          )
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      backgroundColor: DColors.white,
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: widget.spots.last.x / widget.spots.length,
            getTitlesWidget: (value, meta) {
              int convented = (value + 1).ceil();
              return bottomTitleWidgets(value + 1, meta,
                  isFirst: value + 1 == 1.0,
                  isLast: ((value + 1).round() == widget.week));
            },
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: widget.week - 1,
      minY: widget.min,
      maxY: widget.max,
      lineBarsData: [
        LineChartBarData(
          preventCurveOverShooting: true,
          spots: widget.spots,
          isCurved: true,
          gradient: DColors.reportGradient,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData:
          BarAreaData(show: true, gradient: DColors.reportGradient),
        ),
      ],
    );
  }

  final TextStyle _bottomStyle = DpTextStyle.b6.style;

  //값없을때는 표기 x
  Widget bottomTitleWidgets(double value, TitleMeta meta,
      {bool isFirst = false, bool isLast = false}) {
    if (_checkContainValue(
        value - 1, isLast: isLast, is2Week: widget.week == 2)) {
      String text = value.toInt().toString();
      if (isFirst) {
        text = '1${'common_week'.tr}';
      }
      if (isLast) {
        text = '${value.round().toString()}${'common_week'.tr}';
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        // meta: meta,
        child: Text(
          text,
          style: _bottomStyle.copyWith(
              color:
              isLast ? DColors.red : DColors.labelAlternativeColor2),
        ),
      );
    } else {
      return Container();
    }
  }

  bool _checkContainValue(double week,
      {bool isLast = false, bool is2Week = false}) {
    return widget.spots.where((spot) {
      return spot.x == (is2Week ? week : (isLast ? week.round() : week));
    }).isNotEmpty;
  }
}
