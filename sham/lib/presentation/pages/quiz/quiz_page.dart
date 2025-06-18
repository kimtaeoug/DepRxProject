import 'package:api/api.dart';
import 'package:common/component/common/appbar/back_app_bar.dart';
import 'package:common/component/common/dp_progress_bar.dart';
import 'package:common/component/common/loading/loading_frame.dart';
import 'package:core/config/routes.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:sham/presentation/controllers/quiz/quiz_controller.dart';
import 'package:sham/presentation/pages/quiz/quiz_frame.dart';

class QuizPage extends StatefulWidget {
  final int? week = Get.arguments?['week'] as int?;
  final int? currentPage = Get.arguments?['page'] as int?;
  final List<int>? lastEducationList = Get.arguments?['last'] as List<int>?;
  final Function()? move = Get.arguments?['move'] as Function()?;

  QuizPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {
  final QuizController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  late final PageController _pageController =
      PageController(initialPage: widget.currentPage ?? 0);
  late int currentIdx = widget.currentPage ?? 0;

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.quiz);
    _controller.initQuiz(widget.week ?? _controller.week);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          Log.e('here!!!!!');
          if (!value) {
            _move(back: true);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: Obx(() {
            RxBool loading = _controller.quizLoading;
            RxList<QuizDataEntity> quizList = _controller.quizList;
            if (loading.value) {
              return LoadingFrame();
            } else {
              return SizedBox(
                width: _screenUtil.width,
                height: _screenUtil.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _screenUtil.topPadding + 28,
                    ),
                    DPProgressBar(
                      value: currentIdx + 1,
                      totalLength: quizList.length,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BackAppBar(
                      needTopPadding: false,
                      needCloseKeyboard: true,
                      backFunction: () {
                        _move(back: true);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: SizedBox(
                      width: _screenUtil.width,
                      child: PageView(
                        pageSnapping: false,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        children: List.generate(quizList.length, (idx) {
                          QuizDataEntity data = quizList[idx];
                          return QuizFrame(data: data, move: _move);
                        }),
                        onPageChanged: (idx) {
                          setState(() {
                            currentIdx = idx;
                          });
                        },
                      ),
                    ))
                  ],
                ),
              );
            }
          }),
        ));
  }

  void _move({bool back = false}) {
    if (back) {
      Log.e('here!');
      Get.toNamed(Routes.educationPage, arguments: {
        'page': currentIdx,
        'week': widget.week,
      });
    } else {
      Log.e('here2');
      if (currentIdx == _controller.quizList.length-1) {
        Log.e('here3');
        _controller.completeQuiz(
            widget.week ?? 1, widget.lastEducationList ?? [], widget.move);
      } else {
        Log.e('here4');
        setState(() {
          currentIdx += 1;
        });
        _animate(currentIdx);
      }
    }
  }

  void _animate(int page) {
    _pageController.animateToPage(page,
        duration: _screenUtil.duration300, curve: Curves.linear);
  }
}
