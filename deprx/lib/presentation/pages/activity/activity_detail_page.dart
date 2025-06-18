import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:resource/resource_manager.dart';

class ActivityDetailPage extends StatefulWidget {
  final BADoModel? data = Get.arguments?['data'] as BADoModel?;
  bool? fromHome = Get.arguments?['fromHome'] as bool?;

  ActivityDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityDetailPage();
}

class _ActivityDetailPage extends State<ActivityDetailPage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();

  final Duration _animationDuration = const Duration(milliseconds: 400);
  late AnimationController animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      reverseDuration: _animationDuration);

  bool _animationDone = false;

  final String _dummyText = '임ALQ119';
  double _descHeight = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.activityDetail);
    Size _size = UIUtil.textSize(_dummyText, _descriptionStyle);
    super.initState();
    animationController.addStatusListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        animationController.forward();
        setState(() {
          _descHeight = _size.height * 3.5;
        });
      }
      overlayEntry = backAppBarOverlay;
      if (overlayEntry != null) {
        Overlay.of(context).insert(overlayEntry!);
      }
    });
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      if (!_animationDone) {
        setState(() {
          _animationDone = true;
        });
        Future.delayed(_screenUtil.duration200).then((_) {
          _showActivityDoneBottomSheet();
        });
      }
    }
  }

  @override
  void dispose() {
    removeBackAppBarOverlay();
    animationController.removeStatusListener(_listener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                Resource.image('activity_detail_back',
                    width: _screenUtil.width,
                    height: _screenUtil.height,
                    boxFit: BoxFit.cover),
                Positioned(
                    left: (_screenUtil.width - 240) / 2,
                    child: ActivityDetailAnimation(
                        controller: animationController,
                        screenUtil: _screenUtil,
                        widget: _icon())),
              ],
            ),
          ),
        ));
  }

  Widget _icon() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: DColors.white.withValues(alpha: 0.05), width: 3),
          color: DColors.white.withValues(alpha: 0.18)),
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: DPNetworkImage(
            imgPath: widget.data?.imagePath ?? '',
            width: 150,
            height: 150,
            fit: BoxFit.fitWidth,
            isCircle: false,
          ),
        ),
      ),
    );
  }

  final TextStyle _titleStyle =
      DpTextStyle.h4.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _descriptionStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);

  void _showActivityDoneBottomSheet() {
    DPBottomSheet.showBDefaultBottomSheet(
        PopScope(
          canPop: false,
          onPopInvokedWithResult: (value, _) {
            if (!value) {
              Get.close(2);
            }
          },
          child: _activityDoneBottomSheet(),
        ),
        backgroundColor: DColors.white,
        barrierColor: DColors.transparent,
        enableDrag: false,
        isDismissible: false);
  }

  DateTime laterButtonTime = DateTime.now();
  DateTime doneButtonTime = DateTime.now();

  Widget _activityDoneBottomSheet() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 17),
      decoration: BoxDecoration(
          color: DColors.white, borderRadius: _screenUtil.radius20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _screenUtil.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DPBAChip(
                  category: widget.data?.category ?? '',
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  widget.data?.title ?? '',
                  style: _titleStyle,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: _screenUtil.width,
                  height: _descHeight,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data?.description ?? '',
                      style: _descriptionStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DPSmallOutlinedButton(
                width: TabletCheckUtil.check(_screenUtil, context)
                    ? _screenUtil.width * 138 / 390
                    : null,
                text: 'ba_ctaBtn_later'.tr,
                function: () {
                  GAUtil.trackEvent(
                      name: GAEventList.BA_LATER_BUTTON_CLICK,
                      params: {
                        GAParameter.ACTIVITY_NAME: widget.data?.title ?? '',
                        GAParameter.CATEGORY: widget.data?.category ?? '',
                        GAParameter.VIEW_DURATION: GAConverterUtil.differTime(
                            DateTime.now(), laterButtonTime),
                      });
                  Get.close(3);
                },
                buttonType: OutlineButtonType.blue,
              ),
              DPSmallButton(
                width: TabletCheckUtil.check(_screenUtil, context)
                    ? _screenUtil.width * 138 / 390
                    : null,
                text: 'ba_ctaBtn_complete'.tr,
                function: () {
                  GAUtil.trackEvent(
                      name: GAEventList.BA_LATER_BUTTON_CLICK,
                      params: {
                        GAParameter.ACTIVITY_NAME: widget.data?.title ?? '',
                        GAParameter.CATEGORY: widget.data?.category ?? '',
                        GAParameter.VIEW_DURATION: GAConverterUtil.differTime(
                            DateTime.now(), doneButtonTime),
                      });
                  _showCheckActivityBottomSheet();
                },
              )
            ],
          ),
          const SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }

  ///
  /// Check Activity BottomSheet
  ///

  void _showCheckActivityBottomSheet() {
    DPBottomSheet.showBDefaultBottomSheet(_checkActivityBottomSheet(),
        backgroundColor: DColors.black.withValues(alpha: 0.6),
        enableDrag: false,
        isDismissible: false);
  }

  final TextStyle _titleStyle2 =
      DpTextStyle.h4.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _infoStyle = DpTextStyle.b1.style;

  final TextStyle _subTitleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor2);

  Widget _checkActivityBottomSheet() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 17),
      decoration: const BoxDecoration(
          color: DColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 6,
          ),
          Text(
            'ba_overview_title'.tr,
            style: _titleStyle2,
          ),
          const SizedBox(
            height: 8,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'ba_overview_subtitle_prefix'.tr,
                style: _infoStyle.copyWith(color: DColors.primaryNormalColor)),
            TextSpan(
                text: 'ba_overview_subtitle_suffix'.tr,
                style: _infoStyle.copyWith(color: DColors.labelNeutralColor2))
          ])),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: _screenUtil.width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                borderRadius: _screenUtil.radius12, color: DColors.bgBlueColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: DPNetworkImage(
                          imgPath: widget.data?.imagePath ?? '',
                          width: 25,
                          height: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Text(
                  widget.data?.title ?? '',
                  style: _subTitleStyle,
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DPSmallOutlinedButton(
                width: TabletCheckUtil.check(_screenUtil, context)
                    ? _screenUtil.width * 138 / 390
                    : null,
                text: 'ba_ctaBtn_stay'.tr,
                function: () {
                  GAUtil.trackEvent(
                      name: GAEventList.DO_DONE_BUTTON_CLICK,
                      params: {
                        GAParameter.ACTIVITY_NAME: widget.data?.title ?? '',
                        GAParameter.CATEGORY: widget.data?.category ?? '',
                      });
                  Get.back();
                },
                buttonType: OutlineButtonType.blue,
              ),
              DPSmallButton(
                width: TabletCheckUtil.check(_screenUtil, context)
                    ? _screenUtil.width * 138 / 390
                    : null,
                text: 'ba_ctaBtn_reallyComplete'.tr,
                function: () async {
                  GAUtil.trackEvent(
                      name: GAEventList.FINALLY_COMPLETE_ACTIVITY_BUTTON_CLICK,
                      params: {
                        GAParameter.ACTIVITY_NAME: widget.data?.title ?? '',
                        GAParameter.CATEGORY: widget.data?.category ?? ''
                      });
                  removeBackAppBarOverlay();
                  dynamic isBack = await Get.toNamed(Routes.activityEmotionPage,
                      arguments: {
                        'data': widget.data?.activityId ?? '',
                        'isBefore': false,
                        'fromHome': widget.fromHome
                      },
                      preventDuplicates: false);
                  if (isBack == true) {
                    overlayEntry = backAppBarOverlay;
                    if (overlayEntry != null) {
                      Overlay.of(context).insert(overlayEntry!);
                    }
                  }
                },
              )
            ],
          ),
          const SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }

  OverlayEntry? overlayEntry = null;

  OverlayEntry get backAppBarOverlay {
    return OverlayEntry(builder: (context) {
      return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: BackAppBar(
            backFunction: () {
              _closeBottomSheet();
            },
            isDeprx: true,
          ));
    });
  }

  void removeBackAppBarOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  void _closeBottomSheet() {
    if (Get.isBottomSheetOpen == true) {
      Get.back();
      _closeBottomSheet();
    } else {
      Get.back();
    }
  }
}
