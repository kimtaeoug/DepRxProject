import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/alpha_data/alpha_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class KeywordPage extends StatefulWidget {
  KeywordPage({super.key});

  @override
  State<StatefulWidget> createState() => _KeywordPage();
}

class _KeywordPage extends State<KeywordPage> {
  final AlphaDataController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  final List<InterestingKeywordType> _keywordList =
      InterestingKeywordType.values;

  final String _title = 'userKeyword_overview_title'.tr;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.userKeyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: _screenUtil.topPadding + 95,
                            ),
                            DpTitle(
                              title: _title,
                              strongTitle:
                                  'userKeyword_overview_titleStrong'.tr,
                              strongTitleColor: DColors.primaryNormalColor,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: _screenUtil.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 16,
                                  children:
                                      List.generate(_keywordList.length, (idx) {
                                    return _chipItem(_keywordList[idx]);
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                              width: _screenUtil.width,
                              color: DColors.transparent,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 49),
                              child: Obx(() {
                                return DPbutton(
                                  text: 'common_ctaBtn_next'.tr,
                                  function: _move,
                                  isEnabled: _controller.isEnoughKeyWord(),
                                );
                              }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  if (_controller.initAlphaDataLoading.value) {
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

  Widget _chipItem(InterestingKeywordType type) {
    return Obx(() {
      return DPChip(
        text: type.label,
        function: () {
          _controller.clickKeywordChip(type, _addFailFunction);
        },
        isCheck: _controller.isChipCheck(type),
      );
    });
  }

  void _addFailFunction() async {
    ToastHandler().show('userKeyword_toast_error_maxCount'.tr, isError: true);
  }

  void _move() {
    if (_controller.isEnoughKeyWord()) {
      if (!_controller.initAlphaDataLoading.value) {
        _controller.initAlphaData(failFunction: () {
          GAUtil.trackEvent(name: GAEventList.KEYWORD_SUBMIT, params: {
            GAParameter.SELECTED_KEYWORDS_COUNT: _controller.typeList.length
          });
          _controller.initAlphaDataLoading.value = false;
          ToastHandler().showExceptionError();
        });
      }
    }
  }
}
