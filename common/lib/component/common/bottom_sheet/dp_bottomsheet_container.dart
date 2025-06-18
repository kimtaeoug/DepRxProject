import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class DPBottomSheetContainer extends StatefulWidget {
  final Widget child;
  final double minSize;
  final double maxSize;

  const DPBottomSheetContainer(
      {super.key,
      required this.child,
      required this.minSize,
      required this.maxSize});

  @override
  State<StatefulWidget> createState() => _DPBottomSheet();
}

class _DPBottomSheet extends State<DPBottomSheetContainer> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener() {
    if (_controller.pixels <= 1) {
      Get.back();
      _controller.removeListener(_listener);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: _controller,
        initialChildSize: widget.maxSize,
        minChildSize: widget.minSize,
        maxChildSize: widget.maxSize,
        snap: true,
        expand: false,
        builder: (_, controller) {
          return Container(
            width: _screenUtil.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                color: DColors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                controller: controller,
                child: widget.child,
              ),
            ),
          );
        });
  }
}
