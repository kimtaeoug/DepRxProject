import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../common/button/dp_button.dart';
import '../../common/chip/dp_chip.dart';
import '../../common/dp_title.dart';

class DiseaseFrame extends StatefulWidget {
  final Function() moveFunction;
  final Function(DiseaseType) diseaseFunction;
  final bool Function(DiseaseType) getDiseaseValue;
  final List<DiseaseType> diseaseList;
  final bool endAlphaDataLoading;
  final Function(Function()) addAdditionalData;
  final bool isDepRx;

  const DiseaseFrame(
      {super.key,
      required this.moveFunction,
      required this.diseaseFunction,
      required this.getDiseaseValue,
      required this.diseaseList,
      required this.endAlphaDataLoading,
      required this.addAdditionalData,
      this.isDepRx = false});

  @override
  State<StatefulWidget> createState() => _DiseaseFrame();
}

class _DiseaseFrame extends State<DiseaseFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final List<DiseaseType> _diseaseList = DiseaseType.values;

  final String _title = 'disease_overview_title'.tr;
  final String _strongTitle = 'disease_overview_titleStrong'.tr;

  @override
  void initState(){
    GAUtil.trackEvent(name: GAEventList.MEDICAL_CONDITIONS_VIEW, params: {
      GAParameter.SCREEN_NAME : 'disease'
    }, isDeprx: widget.isDepRx);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgAlternativeColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DpTitle(
                    title: _title,
                    strongTitle: _strongTitle,
                    strongTitleColor: DColors.primaryNormalColor,
                    needPadding: false,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 16,
                    children: List.generate(_diseaseList.length, (idx) {
                      DiseaseType type = _diseaseList[idx];
                      return DPChip(
                        text: type.label,
                        function: () {
                          widget.diseaseFunction(type);
                        },
                        isCheck: widget.getDiseaseValue(type),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  width: _screenUtil.width,
                  color: DColors.transparent,
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 49),
                  child: DPbutton(
                    text: 'common_ctaBtn_next'.tr,
                    function: () {
                      if (widget.diseaseList.isNotEmpty) {
                        _process();
                      }
                    },
                    isEnabled: widget.diseaseList.isNotEmpty,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _process() {
    if (!widget.endAlphaDataLoading) {
      widget.addAdditionalData(() {
        widget.moveFunction();
      });
    }
  }
}
