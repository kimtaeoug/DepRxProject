import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class PersonalInfoResultItem extends StatelessWidget {
  final PersonalInfoType type;
  final Function() function;
  final String value;
  final String? value2;

  PersonalInfoResultItem(
      {super.key,
      required this.type,
      required this.function,
      required this.value,
      this.value2});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _labelStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _valueStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _editStyle =
      DpTextStyle.b6.style.copyWith(color: DColors.primaryNormalColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: _screenUtil.width,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: _screenUtil.h16v12,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: DColors.white,
            boxShadow: _screenUtil.blue10Shadow()),
        child: type == PersonalInfoType.birth
            ? _birthContainer()
            : _defaultContainer(),
      ),
    );
  }

  Widget _defaultContainer() {
    return SizedBox(
      width: _screenUtil.width - 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                type.label,
                style: _labelStyle,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(
                value,
                style: _valueStyle,
              ))
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _editBtn(),
          )
        ],
      ),
    );
  }

  Widget _editBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: DColors.bgBlueColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        'common_chip_edit'.tr,
        style: _editStyle,
      ),
    );
  }

  Widget _birthContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'userSummary_checkCell_labelGenderBirth'.tr,
              style: _labelStyle,
            ),
            _editBtn()
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _birthValueContainer(value),
            const SizedBox(
              width: 10,
            ),
            _birthValueContainer(value2 ?? '')
          ],
        )
      ],
    );
  }

  Widget _birthValueContainer(String value) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: DColors.white,
          border: Border.all(color: DColors.bgBlueColor, width: 1)),
      child: Center(
        child: Text(
          value,
          style: _valueStyle,
        ),
      ),
    ));
  }
}
