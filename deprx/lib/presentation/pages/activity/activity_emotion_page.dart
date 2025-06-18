import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:core/config/ga_value_list.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/activity/activity_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ActivityEmotionPage extends StatefulWidget {
  final String? activityId = Get.arguments?['data'] as String?;
  bool? isBefore = Get.arguments?['isBefore'] as bool?;
  bool? fromHome = Get.arguments?['fromHome'] as bool?;

  ActivityEmotionPage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityEmotionPage();
}

class _ActivityEmotionPage extends State<ActivityEmotionPage>
    with WidgetsBindingObserver {
  final ActivityController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  List<int> moodList = [];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.activityEmotion);
    if (widget.isBefore == true) {
      _controller.getOnGoingBAList(
          widget.activityId, widget.isBefore, widget.fromHome);
      GAUtil.trackEvent(
          name: GAEventList.MOOD_SELECTION_VIEW,
          params: {GAParameter.CONTEXT: 'preActivity'});
    } else {
      GAUtil.trackEvent(
          name: GAEventList.MOOD_SELECTION_VIEW,
          params: {GAParameter.CONTEXT: 'postActivity'});
    }
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.isBefore != true){
        _gaScreen();
      }
    });
  }

  void _gaScreen() {
    try {
      BADoModel data = _controller.getBADoModel(widget.activityId ?? '');
      GAUtil.trackEvent(name: GAEventList.BA_SCREEN_VIEW, params: {
        GAParameter.ACTIVITY_NAME: data.title,
        GAParameter.CATEGORY: data.category
      });
    } catch (e) {
      Log.e(e);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.MOOD_SELECTION_EXIT, params: {
            GAParameter.CONTEXT:
            widget.isBefore == true ? 'preActivity' : 'postActivity',
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final String _beforeTitle = 'preActivity_overview_title'.tr;
  final String _afterTitle = 'postActivity_overview_title'.tr;
  final String _subTitle = 'common_activity_emotion_guide'.tr;

  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.black);
  final TextStyle _subTitleStyle = DpTextStyle.b2.style.copyWith(
    color: DColors.black,
  );

  int _currentValue = 2;
  bool showArrow = true;

  void _onChanged(int value) {
    setState(() {
      if (showArrow) {
        showArrow = false;
      }
      _currentValue = value;
      if (widget.isBefore == true) {
        _controller.ongoingBAValue.value =
            _controller.ongoingBAValue.value.copyWith(beforeEmotion: value);
        moodList.add(value);
      } else {
        _controller.ongoingBAValue.value =
            _controller.ongoingBAValue.value.copyWith(afterEmotion: value);
        moodList.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back(result: true);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                Resource.image('activity_back',
                    width: _screenUtil.width, height: _screenUtil.height),
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                        child: SizedBox(
                          width: _screenUtil.width,
                          child: Padding(
                            padding: _screenUtil.defaultHorizontalMargin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.isBefore == true
                                      ? _beforeTitle
                                      : _afterTitle,
                                  style: _titleStyle,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _subTitle,
                                  style: _subTitleStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EmotionSlider(
                            currentValue: _currentValue,
                            onChanged: _onChanged,
                            showArrow: showArrow,
                            isActivity: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 66, top: 80),
                            child: DPbutton(
                              text: 'common_ctaBtn_next'.tr,
                              function: () {
                                if (widget.isBefore == true) {
                                  if (!showArrow) {
                                    _ga(isBefore: true);
                                    _controller.ongoingBAValue.value =
                                        _controller.ongoingBAValue.value
                                            .copyWith(
                                                activityId:
                                                    widget.activityId ?? '');
                                    Get.toNamed(Routes.activityDetailPage,
                                        arguments: {
                                          'data': _controller.getBADoModel(
                                              widget.activityId ?? ''),
                                          'fromHome': widget.fromHome
                                        });
                                  }
                                } else {
                                  if (!showArrow) {
                                    _ga();
                                    _controller.completeBA(widget.fromHome);
                                  }
                                }
                              },
                              isEnabled: !showArrow,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: BackAppBar(
                      backFunction: () {
                        Get.back(result: true);
                      },
                      isDeprx: true,
                    )),
                Obx(() {
                  if (_controller.ongoingLoading.value) {
                    return SmallLoadingFrame();
                  } else {
                    return const SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ));
  }

  void _ga({bool isBefore = false}) {
    try {
      GAUtil.trackEvent(name: GAEventList.MOOD_SELECTED, params: {
        GAParameter.CONTEXT: isBefore ? 'preActivity' : 'postActivity',
        GAParameter.MOOD_CHANGE_LIST: GAConverterUtil.convertList(moodList).toString(),
        GAParameter.MOOD_VALUE: isBefore
            ? _controller.ongoingBAValue.value.beforeEmotion
            : _controller.ongoingBAValue.value.afterEmotion
      });
      moodList.clear();
      moodList = [];
    } catch (e) {
      Log.e(e);
    }
  }
}
