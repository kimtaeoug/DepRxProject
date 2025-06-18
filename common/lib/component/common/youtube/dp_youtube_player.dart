import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:resource/resource_manager.dart';

class DpYoutubePlayer extends StatefulWidget {
  final String path;
  final double? startSecond;
  final bool isDeprx;
  const DpYoutubePlayer({super.key, required this.path, this.startSecond, this.isDeprx = false});

  @override
  State<StatefulWidget> createState() => _DpYoutubePlayer();
}

class _DpYoutubePlayer extends State<DpYoutubePlayer> {
  ValueNotifier<bool> invokeBack = ValueNotifier(false);

  late final _controller = YoutubePlayerController.fromVideoId(
    videoId: YoutubePlayerController.convertUrlToId(widget.path) ?? '',
    startSeconds: widget.startSecond,
    autoPlay: true,
    params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        interfaceLanguage: 'ko'),
  );

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller.enterFullScreen();
    super.initState();
    _controller.setFullScreenListener(_fullScreenListener);
  }

  void _fullScreenListener(bool isFullScreen)async {
    if (!isFullScreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      if (!invokeBack.value) {
        invokeBack.value = true;
        if(widget.isDeprx){
          Get.back(result: await _controller.currentTime);
        }else{
          Get.back();
        }
      }
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _controller.exitFullScreen();
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: YoutubePlayerScaffold(
            defaultOrientations: const [DeviceOrientation.landscapeLeft],
            fullscreenOrientations: const [DeviceOrientation.landscapeLeft],
            backgroundColor: DColors.white,
            enableFullScreenOnVerticalDrag: false,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            builder: (_, child) {
              return child;
            },
            controller: _controller));
  }
}
