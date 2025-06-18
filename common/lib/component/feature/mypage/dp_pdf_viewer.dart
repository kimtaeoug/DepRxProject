import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:resource/resource_manager.dart';
import '../../common/appbar/complete_app_bar.dart';
import '../../common/loading/small_loading_frame.dart';

class DPPdfViewer extends StatefulWidget {
  DPPdfViewer({super.key});

  @override
  State<StatefulWidget> createState() => _DPPdfViewer();
}

class _DPPdfViewer extends State<DPPdfViewer> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final ValueNotifier<String> _filePath = ValueNotifier('');
  final ValueNotifier<Uint8List?> _data = ValueNotifier(null);
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  final String _fileName = 'manual.pdf';

  bool notShow() => _filePath.value == '' || _data.value == null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fromAsset(_fileName);
    });
  }

  Future<void> fromAsset(String filename) async {
    _loading.value = true;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      ByteData data = await Resource.manualByteData(isSham: true);
      Uint8List bytes = data.buffer.asUint8List();
      _data.value = bytes;
      File wroteFile = await file.writeAsBytes(bytes, flush: true);
      _filePath.value = wroteFile.path;
      _loading.value = false;
    } catch (e, s) {
      _loading.value = false;
      throw Exception('Error parsing asset file!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CompleteAppBar(title: 'common_userGuide'.tr),
                Expanded(child: _body())
              ],
            ),
          ),
        ));
  }

  Widget _body() {
    return ValueListenableBuilder(
        valueListenable: _loading,
        builder: (context, value, _) {
          if (value && notShow()) {
            return SmallLoadingFrame();
          } else {
            return PDFView(
              filePath: _filePath.value,
              pdfData: _data.value,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              backgroundColor: DColors.white,
              fitPolicy: FitPolicy.WIDTH,
            );
          }
        });
  }
}
