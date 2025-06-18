import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class RankingController extends GetxController {
  final RankingUseCase rankingUseCase;

  RankingController(this.rankingUseCase);

  final ProcedureService service = Get.find();

  RxMap<int, RankingModel> rankingData = <int, RankingModel>{}.obs;
  RxBool rankingLoading = true.obs;

  void getData({int? week}) {
    int getWeek = week ?? service.week;
    if (!rankingData.containsKey(getWeek)) {
      rankingLoading.value = true;
      rankingUseCase.getRankingData(getWeek, successFunction: (data) {
        rankingData[getWeek] = data;
        rankingData.refresh();
        rankingLoading.value = false;
      }, failFunction: (error) {
        rankingLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }
}
