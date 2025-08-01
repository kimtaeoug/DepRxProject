import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import '../../controllers/library/library_controller.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final LibraryController _controller = Get.find();
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _labelStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.libraryMain, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.initData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Padding(
              padding: EdgeInsets.only(top: _screenUtil.topPadding),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 33, bottom: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'libraryMain_overview_title'.tr,
                            style: _titleStyle,
                          ),
                        ),
                      ),
                      GetBuilder<LibraryController>(builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(3, (idx) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: idx != 2 ? 12 : 0),
                              child: _eduItem(idx + 1, controller.lastEduList,
                                  controller.eduTitle[idx + 1] ?? ''),
                            );
                          }),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: _screenUtil.width,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: DColors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.curriculumDetailPage);
                              },
                              child: Container(
                                width: _screenUtil.width,
                                color: DColors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'common_curriculum_overview_title'.tr,
                                      style: _labelStyle,
                                    ),
                                    Resource.icon('ic_arrow_right_small_blue',
                                        width: 24,
                                        height: 24,
                                        colorFilter: const ColorFilter.mode(
                                            DColors.labelNormalColor,
                                            BlendMode.srcIn)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Container(
                              width: _screenUtil.width,
                              height: 1,
                              color: DColors.lineNeutralColor2
                                  .withValues(alpha: 0.16),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            CurriculumItem(
                              week: '1',
                              title: '주요 우울증과 행동활성화치료 이해하기'.tr,
                              isClicked: _controller.week == 1,
                            ),
                            CurriculumItem(
                              week: '2',
                              title: '활동과 기분의 관계, 회피행동 및 K-BADS 척도 이해하기'.tr,
                              isClicked: _controller.week == 2,
                            ),
                            CurriculumItem(
                                week: '3',
                                title: '행동활성화(BA) 치료 실제 사례'.tr,
                                isClicked: _controller.week == 3),
                            CurriculumItem(
                                week: '4',
                                title: '나를 이해하기'.tr,
                                isClicked: _controller.week == 4),
                            CurriculumItem(
                                week: '5',
                                title: '상황, 감정, 생각 이해하기'.tr,
                                isClicked: _controller.week == 5),
                            CurriculumItem(
                                week: '6',
                                title: '행동 계획하기'.tr,
                                isClicked: _controller.week == 6),
                            CurriculumItem(
                                week: '7',
                                title: '생각과 신념 전환하기'.tr,
                                isClicked: _controller.week == 7),
                            CurriculumItem(
                                week: '8',
                                title: '나의 변화 돌아보기'.tr,
                                isClicked: _controller.week == 8),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _eduItem(int week, List<int> eduList, String title) {
    bool show = !eduList.contains(week);
    if (_controller.week < week) {
      show = false;
    }
    return GestureDetector(
      onTap: () {
        _eduFunction(week, show);
      },
      child: Opacity(
        opacity: show ? 1 : 0.5,
        child:
            LibraryItem(imgPath: 'ic_education_item', title: title, week: week),
      ),
    );
  }

  void _eduFunction(int week, bool go) {
    if (go) {
      if (_controller.week >= week) {
        Get.toNamed(Routes.educationPage,
            arguments: {'week': week, 'fromTab': true});
      } else {
        ToastHandler().show('$week주차부터 볼 수 있어요.', isError: true);
      }
    } else {
      ToastHandler().show('$week주차부터 볼 수 있어요.', isError: true);
    }
  }
}
