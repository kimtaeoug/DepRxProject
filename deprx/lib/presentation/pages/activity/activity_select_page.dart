import 'package:api/data/model/activity/activity_select_item_model.dart';
import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/activity/activity_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ActivitySelectPage extends StatefulWidget {
  ActivitySelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivitySelectPage();
}

class _ActivitySelectPage extends State<ActivitySelectPage> {
  final ActivityController _controller = Get.find();
  final PageController _pageController = PageController();
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentIdx = 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.activitySelect);
    SplashUtil.preWord();
    _controller.initRecommendedBA();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RxBool loading = _controller.recommendedBALoading;
      RxList<Widget> frameList = _controller.frameList;
      RxBool selectedBALoading = _controller.selectBALoading;
      RxList<ActivitySelectItemModel> activitySelectList =
          _controller.activitySelectList;
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (value, _) {
            if (!value) {
              _move(frameList, activitySelectList, isForward: false);
            }
          },
          child: Scaffold(
            backgroundColor: DColors.white,
            body: SizedBox(
              width: _screenUtil.width,
              height: _screenUtil.height,
              child: loading.value || selectedBALoading.value
                  ? SmallLoadingFrame()
                  : Stack(
                      children: [
                        SizedBox(
                          width: _screenUtil.width,
                          height: _screenUtil.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              BackAppBar(
                                needTopPadding: true,
                                backFunction: () {
                                  _move(
                                      frameList.value, activitySelectList,
                                      isForward: false);
                                },
                                showBack: _currentIdx != 0,
                                isDeprx: true,
                              ),
                              Expanded(
                                  child: PageView.builder(
                                      pageSnapping: false,
                                      padEnds: false,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: _pageController,
                                      onPageChanged: (idx) {
                                        setState(() {
                                          _currentIdx = idx;
                                        });
                                        _viewGA(activitySelectList);
                                      },
                                      itemCount: frameList.length,
                                      itemBuilder: (context, idx) {
                                        return frameList[idx];
                                      })),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 37),
                                child: DPbutton(
                                    text: 'common_ctaBtn_next'.tr,
                                    function: () {
                                      if (!(_controller.containEmpty(
                                          _currentIdx, -1))) {
                                        _move(frameList.value,
                                            activitySelectList);
                                      }
                                    },
                                    isEnabled: !(_controller.containEmpty(
                                        _currentIdx, -1))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ));
    });
  }

  DateTime _time = DateTime.now();
  void _move(
      List<Widget> frameList, RxList<ActivitySelectItemModel> activitySelectList,
      {bool isForward = true}) async {
    if (isForward) {
      if (_currentIdx == frameList.length - 1) {
        _controller.completeSelectedBA();
      } else {
        setState(() {
          _currentIdx += 1;
        });
      }
      _viewGA(activitySelectList, isClick: true);
    } else {
      if (_currentIdx != 0) {
        setState(() {
          _currentIdx -= 1;
        });
      }
    }
    _pageController.animateToPage(_currentIdx,
        duration: _screenUtil.duration300, curve: Curves.linear);
  }
  void _viewGA(RxList<ActivitySelectItemModel> activitySelectList, {bool isClick = false}){
    try{
      if(activitySelectList.length >= _currentIdx){
        ActivitySelectItemModel data = activitySelectList[_currentIdx];
        if(data.weekOfDay.contains(' ')){
          List<String> splitted = data.weekOfDay.split(' ');
          if(splitted.length == 2){
            if(isClick){
              GAUtil.trackEvent(name: GAEventList.BA_NEXT_CLICK, params: {
                GAParameter.WEEK : splitted.first,
                GAParameter.DAY : splitted.last,
                GAParameter.VIEW_DURATION : GAConverterUtil.differTime(DateTime.now(), _time)
              });
              _time = DateTime.now();
            }else{
              GAUtil.trackEvent(name: GAEventList.BA_SELECTION_VIEW, params: {
                GAParameter.WEEK : splitted.first,
                GAParameter.DAY : splitted.last
              });
            }
          }
        }
      }
    }catch(e,s){
      Log.e('E : $e\nS :$s');
    }
  }
}
