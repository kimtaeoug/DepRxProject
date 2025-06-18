import 'package:flutter/cupertino.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';
import '../dp_network_img.dart';

class YoutubeThumbNailBtn extends StatelessWidget {
  final String imgPath;
  final String time;
  final Function() function;

  YoutubeThumbNailBtn(
      {super.key,
      required this.imgPath,
      required this.time,
      required this.function});

  final TextStyle _timeStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.white);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: _screenUtil.radius12,
          child: Stack(
            children: [
              DPNetworkImage(
                imgPath: imgPath,
                width: _screenUtil.width,
                isCircle: false,
                fit: BoxFit.cover,
              ),
              Container(
                color: DColors.black.withValues(alpha: 0.3),
              ),
              Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DColors.black.withValues(alpha: 0.3)),
                  child: Center(
                    child: _screenUtil.svgIcon('$ICON_PATH/ic_player.svg'),
                  ),
                ),
              ),
              Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: _screenUtil.radius8,
                        color: DColors.black.withValues(alpha: 0.5)),
                    child: Text(
                      time,
                      style: _timeStyle,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
