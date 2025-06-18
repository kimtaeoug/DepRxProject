import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class QuizFrame extends StatefulWidget {
  final QuizDataEntity data;
  final Function() move;

  const QuizFrame({super.key, required this.data, required this.move});

  @override
  State<StatefulWidget> createState() => _QuizFrame();
}

class _QuizFrame extends State<QuizFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  int clickedIdx = 0;
  QuizType _selectedType = QuizType.normal;
  late int answerIdx = widget.data.answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: _screenUtil.defaultHorizontalMargin,
            child: DpTitle(
              title: widget.data.title,
              needPadding: false,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(widget.data.select.length, (idx) {
                        String selection = widget.data.select[idx];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 16 +
                                  (idx == widget.data.select.length - 1
                                      ? 4
                                      : 0)),
                          child: _item(idx + 1, selection),
                        );
                      }),
                    ),
                    if (_selectedType != QuizType.normal)
                      QuizBanner(
                        type: _selectedType,
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
                    if (_selectedType != QuizType.normal)
                      Padding(
                        padding: EdgeInsets.only(bottom: 41),
                        child: DPbutton(
                          text: 'common_ctaBtn_next'.tr,
                          function: () {
                            if (_selectedType == QuizType.success) {
                              widget.move();
                            }
                          },
                          isEnabled: _selectedType == QuizType.success,
                        ),
                      )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _item(int idx, String selection) {
    return GestureDetector(
      onTap: () {
        if (idx == clickedIdx) {
          setState(() {
            clickedIdx = 0;
            _selectedType = QuizType.normal;
          });
        } else {
          setState(() {
            clickedIdx = idx;
            if (idx == answerIdx) {
              _selectedType = QuizType.success;
            } else {
              _selectedType = QuizType.fail;
            }
          });
          if (_selectedType == QuizType.fail) {
            ToastHandler().showExceptionError(text: '답을 다시 골라볼까요?');
          }
        }
      },
      child: QuizContainer(
        text: selection,
        type: _checkType(idx),
      ),
    );
  }

  QuizType _checkType(int idx) {
    if (idx == clickedIdx) {
      if (idx == answerIdx) {
        return QuizType.success;
      } else {
        return QuizType.fail;
      }
    } else {
      return QuizType.normal;
    }
  }
}
