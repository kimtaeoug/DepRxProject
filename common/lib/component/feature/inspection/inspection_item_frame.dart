import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class InspectionItemFrame extends StatelessWidget {
  final String title;
  final int pageIdx;
  final Function(int) clickFunction;
  final bool Function(int, int) isClicked;

  InspectionItemFrame({super.key,
    required this.title,
    required this.pageIdx,
    required this.clickFunction,
    required this.isClicked});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _orderContainer(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: _screenUtil.width,
                  child: Text(
                    title,
                    style: _titleStyle,
                  ),
                ),
              ],
            ),
            _valueList(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _orderContainer(notShow: true),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: _screenUtil.width,
                  child: Text(
                    title,
                    style: _titleNotShowStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///
  /// header
  ///
  final TextStyle _orderStyle =
  DpTextStyle.detail1.style.copyWith(color: DColors.white);
  final TextStyle _orderNotShowStyle =
  DpTextStyle.detail1.style.copyWith(color: DColors.transparent);

  Widget _orderContainer({bool notShow = false}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: notShow ? DColors.transparent : DColors.accentLightBlue),
      child: Center(
        child: Text(
          pageIdx.toString(),
          style: notShow ? _orderNotShowStyle : _orderStyle,
        ),
      ),
    );
  }

  final TextStyle _titleStyle = DpTextStyle.h3.style
      .copyWith(color: DColors.labelNormalColor, height: 1.5);
  final TextStyle _titleNotShowStyle =
  DpTextStyle.h3.style.copyWith(color: DColors.transparent);

  ///
  /// item
  ///
  final TextStyle _itemStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.black);
  final TextStyle _itemSelectedStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.primaryNormalColor);

  Widget _valueItem(int value, BuildContext context,
      {bool isSelected = false}) {
    return Container(
      padding: TabletCheckUtil.check(_screenUtil, context) ? const EdgeInsets
          .symmetric(vertical: 24, horizontal: 36) : const EdgeInsets.all(16),
      decoration: isSelected
          ? BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: DColors.bgBlueColor,
          border: Border.all(color: DColors.primaryNormalColor),
          boxShadow: [BoxShadow(color: DColors.black.withValues(alpha: 0.2))])
          : const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: DColors.white),
      child: SizedBox(
        height: 26,
        child: Center(
          child: Text(
            value.toString(),
            style: isSelected ? _itemSelectedStyle : _itemStyle,
          ),
        ),
      ),
    );
  }

  Widget _valueList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(7, (idx) {
            return GestureDetector(
              onTap: () {
                clickFunction(idx);
              },
              child:
              _valueItem(idx, context, isSelected: isClicked(idx, pageIdx - 1)),
            );
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'kbadsProgress_mutilpleChoice_worst'.tr,
              style: _itemStyle,
            ),
            Text(
              'kbadsProgress_mutilpleChoice_best'.tr,
              style: _itemStyle,
            )
          ],
        )
      ],
    );
  }
}
