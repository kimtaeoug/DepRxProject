import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';
import 'animation/dp_img_skeleton.dart';

///
/// Image Widget for DepRx
///
class DPNetworkImage extends StatelessWidget {
  final String imgPath;
  final double width;
  final double? height;
  final bool isCircle;
  final BoxFit? fit;

  const DPNetworkImage(
      {super.key,
      required this.imgPath,
      required this.width,
      this.height,
      this.isCircle = false,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: DColors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: isCircle
              ? const BorderRadius.all(Radius.circular(100))
              : const BorderRadius.all(Radius.circular(4)),
          child: ExtendedImage.network(
            imgPath,
            width: width,
            height: height,
            filterQuality: FilterQuality.high,
            imageCacheName: imgPath,
            fit: fit ?? BoxFit.cover,
            cache: false,
            cacheRawData: false,
            loadStateChanged: (state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return _skeleton();
                case LoadState.completed:
                  return state.completedWidget;
                case LoadState.failed:
                  return Image.network(
                    imgPath,
                    fit: fit ?? BoxFit.cover,
                    width: width,
                    height: height,
                    filterQuality: FilterQuality.high,
                    loadingBuilder: (_, __, ___) => _skeleton(),
                    errorBuilder: (_, __, ___) => _placeHolder(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
  Widget _placeHolder() => Resource.image('ic_placeholder', width: width, height: height);

  Widget _skeleton() => DPImgSkeleton(width: width, height: height);
}
