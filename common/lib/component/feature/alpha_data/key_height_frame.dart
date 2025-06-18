import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../common/button/dp_button.dart';
import '../../common/dp_spacer.dart';
import '../../common/dp_title.dart';
import 'key_height_item.dart';

class KeyHeightFrame extends StatefulWidget {
  final Function() moveFunction;
  final String height;
  final String weight;
  final Function(String) setHeight;
  final Function(String) setWeight;
  final bool isDeprx;

  const KeyHeightFrame(
      {super.key,
      required this.moveFunction,
      required this.height,
      required this.weight,
      required this.setWeight,
      required this.setHeight,
      this.isDeprx = false});

  @override
  State<StatefulWidget> createState() => _KeyHeightFrame();
}

class _KeyHeightFrame extends State<KeyHeightFrame> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final ScreenUtil _screenUtil = ScreenUtil();

  bool _heightFocus = false;
  bool _weightFocus = false;

  @override
  void initState() {
    GAUtil.trackEvent(
        name: GAEventList.HEIGHT_WEIGHT_VIEW,
        params: {GAParameter.SCREEN_NAME: 'body'},
        isDeprx: widget.isDeprx);
    super.initState();
    _heightFocusNode.addListener(_heightFocusListener);
    _weightFocusNode.addListener(_weightFocusListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _heightFocusNode.requestFocus();
      if (widget.height != '') {
        _heightController.text = widget.height;
      }
      if (widget.weight != '') {
        _weightController.text = widget.weight;
      }
    });
  }

  void _heightFocusListener() {
    if (_heightFocusNode.hasFocus) {
      setState(() {
        _heightFocus = true;
      });
    } else {
      setState(() {
        _heightFocus = false;
      });
    }
  }

  void _weightFocusListener() {
    if (_weightFocusNode.hasFocus) {
      setState(() {
        _weightFocus = true;
      });
    } else {
      setState(() {
        _weightFocus = false;
      });
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _heightFocusNode.removeListener(_heightFocusListener);
    _weightFocusNode.removeListener(_weightFocusListener);
    _heightFocusNode.dispose();
    _weightFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgAlternativeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DpTitle(
              title: 'body_overview_title'.tr,
              needPadding: false,
            ),
          ),
          DpSpacer(
            width: _screenUtil.width,
            height: 40,
            needKeyboardClose: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KeyHeightItem(
                  title: 'body_heightWeight_label_height'.tr,
                  label: 'cm',
                  textEditingController: _heightController,
                  focusNode: _heightFocusNode,
                  isFocus: _heightFocus,
                  onTap: () {
                    if (!_heightFocus) {
                      _heightFocusNode.requestFocus();
                    } else {
                      UIUtil.closeKeyBoard();
                    }
                  },
                  onChanged: (value) {
                    if (value != null) {
                      widget.setHeight(value);
                      // _controller.height.value = value;
                    }
                  },
                  onSubmitted: (_) {
                    GAUtil.trackEvent(
                        name: GAEventList.HEIGHT_INPUT_SUBMIT,
                        params: {
                          GAParameter.INPUT_VALUE: _heightController.text
                        },
                        isDeprx: widget.isDeprx
                    );
                    _weightFocusNode.requestFocus();
                  },
                ),
                KeyHeightItem(
                  title: 'body_heightWeight_label_weight'.tr,
                  label: 'kg',
                  textEditingController: _weightController,
                  focusNode: _weightFocusNode,
                  isFocus: _weightFocus,
                  isHeight: false,
                  onTap: () {
                    if (!_weightFocus) {
                      _weightFocusNode.requestFocus();
                    } else {
                      UIUtil.closeKeyBoard();
                    }
                  },
                  onChanged: (value) {
                    if (value != null) {
                      widget.setWeight(value);
                      // _controller.weight.value = value;
                    }
                  },
                  onSubmitted: (_) {
                    GAUtil.trackEvent(
                        name: GAEventList.WEIGHT_INPUT_SUBMIT,
                        params: {
                          GAParameter.INPUT_VALUE: _weightController.text
                        }, isDeprx: widget.isDeprx);
                    if (passCondition()) {
                      GAUtil.trackEvent(
                          name: GAEventList.HEIGHT_WEIGHT_SUBMIT,
                          params: {
                            GAParameter.HEIGHT: _heightController.text,
                            GAParameter.WEIGHT: _weightController.text,
                            GAParameter.SUCCESS: 'true'
                          }, isDeprx: widget.isDeprx);
                      widget.moveFunction();
                    }
                  },
                )
              ],
            ),
          ),
          DpSpacer(
            width: _screenUtil.width,
            height: 30,
            needKeyboardClose: true,
          ),
          DPbutton(
            text: 'common_ctaBtn_next'.tr,
            function: () {
              if (widget.height.length >= 2 && widget.weight.length >= 2) {
                GAUtil.trackEvent(
                    name: GAEventList.HEIGHT_WEIGHT_SUBMIT,
                    params: {
                      GAParameter.HEIGHT: _heightController.text,
                      GAParameter.WEIGHT: _weightController.text,
                      GAParameter.SUCCESS: 'true'
                    },
                  isDeprx: widget.isDeprx
                );
                widget.moveFunction();
              }
            },
            isEnabled: passCondition(),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              if (_heightController.text.isNotEmpty) {
                GAUtil.trackEvent(
                    name: GAEventList.HEIGHT_INPUT_SUBMIT,
                    params: {
                      GAParameter.INPUT_VALUE: _heightController.text
                    },
                    isDeprx: widget.isDeprx
                );
              }
              if (_weightController.text.isNotEmpty) {
                GAUtil.trackEvent(
                    name: GAEventList.WEIGHT_INPUT_SUBMIT,
                    params: {
                      GAParameter.INPUT_VALUE: _weightController.text
                    },
                    isDeprx: widget.isDeprx
                );
              }
              UIUtil.closeKeyBoard();
            },
            child: Container(
              width: _screenUtil.width,
              color: DColors.transparent,
            ),
          ))
        ],
      ),
    );
  }

  bool passCondition() =>
      widget.height.length >= 2 && widget.weight.length >= 2;
}
