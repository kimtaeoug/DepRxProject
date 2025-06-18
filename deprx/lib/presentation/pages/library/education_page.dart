import 'package:deprx/presentation/controllers/library/library_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class EducationPage extends StatefulWidget {
  final int? week = Get.arguments?['week'] as int?;
  final bool? fromTab = Get.arguments?['fromTab'] as bool?;

  EducationPage({super.key});

  @override
  State<StatefulWidget> createState() => _EducationPage();
}

class _EducationPage extends State<EducationPage>{
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _weekStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.palettePurple502);
  final TextStyle _headerStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  final TextStyle _descTitleStyle = DpTextStyle.h6.style
      .copyWith(color: DColors.primaryNormalColor, height: 1.4);
  final TextStyle _descContentsStyle = DpTextStyle.detail2.style.copyWith(
      fontSize: 15,
      color: DColors.labelNeutralColor2,
      height: 1.8,
      fontWeight: FontWeight.w500);
  final TextStyle _descStrongStyle = DpTextStyle.detail2.style.copyWith(
      fontSize: 15,
      color: DColors.labelNormalColor,
      height: 1.8,
      fontWeight: FontWeight.w700);
  final TextStyle _descExStrongStyle = DpTextStyle.detail2.style.copyWith(
      fontSize: 15,
      color: DColors.palletPurple400,
      height: 1.8,
      fontWeight: FontWeight.w500);
  final TextStyle _descWeekStyle = DpTextStyle.detail2.style.copyWith(
      fontSize: 15, color: DColors.labelAlternativeColor2, height: 1.8);

  late bool isNotFromTab = widget.fromTab != true;

  final LibraryController _controller = Get.find<LibraryController>();
  DateTime _now = DateTime.now();

  Duration _lastTime = Duration();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.education, params: {GAParameter.WEEK : widget.week ?? 1});
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.initData();
    });
  }


  @override
  void dispose() {
    if (isNotFromTab) {
      _controller.clearLastEduList();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(builder: (controller) {
      bool initLoading = controller.initLoading;
      bool lastEduLoading = controller.lastEduLoading;
      List<int> lastEduList = controller.lastEduList;
      if (initLoading ||
          lastEduLoading ||
          (isNotFromTab && _controller.checkIsAllMinus())) {
        return _loading;
      } else {
        int? eduWeek;
        if (widget.week != null) {
          eduWeek = widget.week;
        } else {
          eduWeek = lastEduList.where((e) => e != -1).first;
        }
        EducationItemModel data =
            controller.eduMap[eduWeek] ?? const EducationItemModel();
        bool isCheck = controller.isCheck;
        return PopScope(
            canPop: false,
            onPopInvokedWithResult: (value, child) {
              if (!value) {
                if (isNotFromTab != true) {
                  Get.back();
                }
              }
            },
            child: Scaffold(
              backgroundColor: DColors.white,
              body: SizedBox(
                width: _screenUtil.width,
                height: _screenUtil.height,
                child: Padding(
                  padding: EdgeInsets.only(top: _screenUtil.topPadding),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TitleAppBar(
                            title: '${data.week}${'common_week'.tr}',
                            notShowBack: isNotFromTab,
                            needTopPadding: false,
                            isDeprx: true,
                          ),
                          Padding(
                            padding: _screenUtil.defaultHorizontalMargin,
                            child: Container(
                              width: _screenUtil.width,
                              padding: _screenUtil.defaultAllMargin,
                              decoration: BoxDecoration(
                                  color: DColors.white,
                                  borderRadius: _screenUtil.radius12,
                                  border: Border.all(
                                      color: DColors.lineNeutralColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${data.week}${'common_week'.tr}',
                                    style: _weekStyle,
                                  ),
                                  SizedBox(
                                    width: _screenUtil.width,
                                    child: Text(
                                      data.title,
                                      style: _headerStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: _screenUtil.defaultHorizontalMargin,
                        child: YoutubeThumbNailBtn(
                            imgPath: data.thumbNailPath,
                            time: data.time,
                            function: () async {
                              GAUtil.trackEvent(
                                  name: GAEventList.EDUCATION_DETAIL_VIDEO_PLAY,
                                  params: {});
                              double lastTime =
                                  await Get.to(() => DpYoutubePlayer(
                                        path: data.videoPath,
                                        isDeprx: true,
                                      ));
                              _lastTime = Duration(seconds: lastTime.toInt());
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(data.description.length, (idx) {
                          EducationDescItemModel descData =
                              data.description[idx];
                          double padding =
                              idx != data.description.length - 1 ? 32 : 0;
                          if (descData.type == 'number') {
                            return Padding(
                              padding: EdgeInsets.only(bottom: padding),
                              child: EducationNumberItem(
                                  data: descData,
                                  titleStyle: _descTitleStyle,
                                  contentsStyle: _descContentsStyle,
                                  strongStyle: _descStrongStyle,
                                  weekStyle: _descWeekStyle),
                            );
                          } else if (descData.type == 'ex') {
                            return Padding(
                              padding: EdgeInsets.only(bottom: padding),
                              child: EducationDefaultItem(
                                  data: descData,
                                  titleStyle: _descTitleStyle,
                                  contentsStyle: _descContentsStyle,
                                  strongStyle: _descExStrongStyle,
                                  weekStyle: _descWeekStyle),
                            );
                          } else if (descData.type == 'img') {
                            return Padding(
                              padding: EdgeInsets.only(bottom: padding),
                              child: Resource.educationImage(descData.img, width: TabletCheckUtil.check(_screenUtil, context) ? _screenUtil.width-48 : null),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(bottom: padding),
                              child: EducationDefaultItem(
                                  data: descData,
                                  titleStyle: _descTitleStyle,
                                  contentsStyle: _descContentsStyle,
                                  strongStyle: _descStrongStyle,
                                  weekStyle: _descWeekStyle),
                            );
                          }
                        }),
                      ),
                      //Resource.edu
                      if (isNotFromTab)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setIsCheck(!isCheck);
                              },
                              child: CheckBoxItem(
                                isCheck: isCheck,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            DPbutton(
                              text: 'common_complete'.tr,
                              function: () {
                                try {
                                  int total =
                                      GAConverterUtil.convertStringToIntTime(
                                          data.time);
                                  GAUtil.trackEvent(
                                      name: GAEventList
                                          .EDUCATION_DETAIL_COMPLETE_CLICK,
                                      params: {
                                        GAParameter.WEEK: widget.week ?? 0,
                                        GAParameter.VIEW_DURATION:
                                            '${(DateTime.now().difference(_now).inSeconds - _lastTime.inSeconds)}s',
                                        GAParameter.VIDEO_PROGRESS:
                                            '${_lastTime.inSeconds / total * 100}%'
                                      });
                                } catch (e) {
                                  Log.e(e);
                                }
                                controller.complete(eduWeek ?? 1, isNotFromTab);
                              },
                              isEnabled: isCheck,
                            ),
                          ],
                        ),
                      SizedBox(
                        height: isNotFromTab ? 35 : 60,
                      )
                    ],
                  )),
                ),
              ),
            ));
      }
    });
  }

  final Widget _loading = PopScope(
      canPop: false,
      child: SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: DColors.white,
            body: LoadingFrame(),
          )));
}
