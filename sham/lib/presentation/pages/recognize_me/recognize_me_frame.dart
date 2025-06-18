import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class RecognizeMeFrame extends StatefulWidget {
  final RecognizeMeItemEntity data;
  final Function() move;
  final Function(String) onChanged;
  final String? writtenData;

  const RecognizeMeFrame(
      {super.key,
      required this.data,
      required this.move,
      required this.onChanged,
      this.writtenData});

  @override
  State<StatefulWidget> createState() => _RecognizeMeFrame();
}

class _RecognizeMeFrame extends State<RecognizeMeFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _editingController = TextEditingController();
  final DiaryType type = DiaryType.rm;

  int textLength = 0;
  bool alreadyEnter = false;

  @override
  void initState() {
    super.initState();
    _editingController.addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.writtenData != null) {
        setState(() {
          _editingController.text = widget.writtenData ?? '';
        });
      }
    });
  }

  @override
  void dispose() {
    _editingController.removeListener(_listener);
    _editingController.dispose();
    super.dispose();
    UIUtil.closeKeyBoard();
  }

  void _listener() {
    setState(() {
      textLength = _editingController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              UIUtil.closeKeyBoard();
            },
            child: Container(
              color: DColors.transparent,
              margin: EdgeInsets.only(bottom: 16),
              child: DpTitle(
                title: widget.data.title,
                padding: EdgeInsets.symmetric(horizontal: 24),
                needPadding: false,
              ),
            ),
          ),
          SizedBox(
            width: _screenUtil.width,
            child: DpDiaryTextField(
              controller: _editingController,
              onChanged: (value) {
                if (value != null) {
                  if (!alreadyEnter) {
                    setState(() {
                      alreadyEnter = true;
                    });
                  }
                  widget.onChanged(value);
                }
              },
              hintText: widget.data.hint,
              minLength: type.minLength,
              maxLength: type.maxLength,
              length: textLength,
              onSubmitted: (_) {
                if (passCondition()) {
                  widget.move();
                }
              },
              errorText:
                  DiaryTypeExtension.errorText(type, textLength, alreadyEnter),
              btnFunction: widget.move,
              passCondition: passCondition(),
            ),
          ),
          DPExpendedSpacer(width: _screenUtil.width)
        ],
      ),
    );
  }

  bool passCondition() => DiaryTypeExtension.passCondition(type, textLength);
}
