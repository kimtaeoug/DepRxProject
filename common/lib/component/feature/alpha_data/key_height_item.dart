import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resource/resource_manager.dart';

class KeyHeightItem extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String?) onChanged;
  final Function() onTap;
  final bool isFocus;
  final bool isHeight;
  final Function(String?)? onSubmitted;

  KeyHeightItem(
      {super.key,
      required this.title,
      required this.label,
      required this.textEditingController,
      required this.focusNode,
      required this.onChanged,
      required this.onTap,
      this.isFocus = false,
      this.isHeight = true,
      this.onSubmitted});

  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.primaryNormalColor);
  final TextStyle _valueStyle = DpTextStyle.h5.style.copyWith(
      color: DColors.labelNormalColor,
      decoration: TextDecoration.none,
      decorationThickness: 0);
  final TextStyle _labelStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: (_screenUtil.width - 70) / 2,
        height: 160,
        child: Stack(
          children: [
            Container(
              width: (_screenUtil.width - 70) / 2,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: isFocus ? DColors.bgEtcColor : DColors.white,
                  border: Border.all(
                      color:
                          isFocus ? DColors.primaryNormalColor : DColors.white),
                  boxShadow: [
                    BoxShadow(color: DColors.black.withOpacity(0.5))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: _titleStyle,
                  ),
                  const SizedBox(
                    height: 39.32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 7),
                            child: SizedBox(
                              width: 34,
                              child: TextField(
                                focusNode: focusNode,
                                controller: textEditingController,
                                onChanged: onChanged,
                                style: _valueStyle,
                                keyboardType: TextInputType.number,
                                cursorColor: DColors.labelNormalColor,
                                cursorHeight: 16,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  counterText: '',
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                ),
                                onSubmitted: onSubmitted,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 2,
                            color: isFocus
                                ? DColors.primaryNormalColor
                                : DColors.black,
                          )
                        ],
                      ),
                      Text(
                        label,
                        style: _labelStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            if (isFocus)
              Positioned(
                top: 11,
                right: 10,
                child:
                    Resource.icon('ic_check_only_short', width: 18, height: 18),
              )
          ],
        ),
      ),
    );
  }
}
