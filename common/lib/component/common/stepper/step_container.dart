import 'package:flutter/cupertino.dart';
import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'step_item_container.dart';
import 'stepper_title.dart';
import 'unopened_stepper_container.dart';

class StepContainer extends StatefulWidget {
  final List<StepItemModel> dataList;
  final bool isStartFinal;
  final Function() routeFunction;

  const StepContainer({super.key,
    required this.dataList,
    this.isStartFinal = false,
    required this.routeFunction});

  @override
  State<StatefulWidget> createState() => _StepContainer();
}

class _StepContainer extends State<StepContainer> {
  final ScreenUtil _screenUtil = ScreenUtil();
  int dataListLength = 0;

  List<StepItemModel> stepList = [];

  @override
  void initState() {
    List<StepItemModel> result = [];
    result = widget.dataList.where((e) => e.value != '').toList();
    if(!widget.isStartFinal){
      result.add(widget.dataList.last);
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        stepList = result;
        dataListLength = stepList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _screenUtil.defaultHorizontalMargin,
      padding: _screenUtil.defaultAllMargin,
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20, color: DColors.bgBlueColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StepperTitle(
              title: 'main_rewardStepper_title'.tr,
              function: () {
                widget.routeFunction();
              }),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(dataListLength, (idx) {
              StepItemModel data = stepList[idx];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _whichContainer(data, idx),
                  if (idx != stepList.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Resource.icon('ic_step_border',
                          width: 2, height: 28, boxFit: BoxFit.cover),
                    )
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _whichContainer(StepItemModel data, int idx) {
    if (idx != dataListLength - 1) {
      return StepItemContainer(
        imgPath: data.imagePath,
        value: data.value,
        week: data.week,
        date: data.date,
      );
    } else {
      if (widget.isStartFinal) {
        return StepItemContainer(
          imgPath: data.imagePath,
          value: data.value,
          week: data.week,
          date: data.date,
        );
      } else {
        return UnOpenedStepperContainer(
          week: data.week,
          isFail: idx == 2,
        );
      }
    }
  }
}
