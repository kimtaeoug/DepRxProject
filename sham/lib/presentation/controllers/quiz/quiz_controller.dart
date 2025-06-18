import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';
import 'package:sham/core/service/procedure_service.dart';

class QuizController extends GetxController {
  final ProcedureService _service = Get.find();
  final JsonService _jsonService = JsonService();

  int get week => _service.week;

  int get round => _service.round;

  RxBool quizLoading = true.obs;
  RxList<QuizDataEntity> quizList = <QuizDataEntity>[].obs;

  void initQuiz(int week) async {
    try {
      if (quizList.isEmpty) {
        quizLoading.value = true;
        quizList.value = await Resource.quizData(_jsonService, week);
        _prefUtil.saveQuizData(week);
        quizList.refresh();
        quizLoading.value = false;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  final PrefUtil _prefUtil = PrefUtil();

  void completeQuiz(
      int week, List<int> lastEducationList, Function()? function) async {
    try {
      _prefUtil.saveQuizData(null).then((_) {
        if (lastEducationList.where((e) => e == -1).length ==
                lastEducationList.length ||
            lastEducationList.where((e) => e != -1).first <= week) {
          if (function != null) {
            function();
          } else {
            _service.move();
          }
        } else {
          Get.offNamed(Routes.continuousEducationPage,
              arguments: {'week': week});
        }
      });
    } catch (e) {
      ToastHandler().logicError();
    }
  }
}
