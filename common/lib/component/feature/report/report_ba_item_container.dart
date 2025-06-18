import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import '../../common/dp_network_img.dart';

class ReportBAItemContainer extends StatelessWidget {
  final List<BAModel> dataList;
  final String header;

  ReportBAItemContainer(
      {super.key, required this.dataList, required this.header});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _contentsStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _doneContentsStyle = DpTextStyle.b1.style.copyWith(
      color: DColors.labelAlternativeColor2,
      decoration: TextDecoration.lineThrough);
  final TextStyle _dateStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.primaryNormalColor);
  final TextStyle _headStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _headContainer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(dataList.length, (idx) {
            BAModel data = dataList[idx];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: _screenUtil.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: DColors.white.withOpacity(0.6)),
                  color: DColors.white,
                  boxShadow: _screenUtil.pressShadow()),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: data.done ? _doneContainer(data) : yetContainer(data),
            );
          }),
        )
      ],
    );
  }

  Widget _headContainer() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          header,
          style: _headStyle,
        ),
      ),
    );
  }

  Widget yetContainer(BAModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: DPNetworkImage(imgPath: data.imagePath, width: 50, height: 50),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          data.contents,
          style: _contentsStyle,
        ))
      ],
    );
  }

  Widget _doneContainer(BAModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            width: 46,
            height: 52,
            child: Center(
              child: _checkBox,
            ),
          ),
        ),
        Expanded(
            child: Text(
          data.contents,
          style: _doneContentsStyle,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            TimeUtil.covertDateToAMPM(data.date),
            style: _dateStyle,
          ),
        )
      ],
    );
  }

  final Widget _checkBox = SizedBox(
    width: 46,
    height: 46,
    child: Center(
      child: Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(
            color: DColors.primaryNormalColor,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Resource.icon('ic_check_only_enable',
              width: 20,
              height: 10,
              boxFit: BoxFit.fitWidth,
              colorFilter:
                  const ColorFilter.mode(DColors.white, BlendMode.srcIn)),
        ),
      ),
    ),
  );
}
