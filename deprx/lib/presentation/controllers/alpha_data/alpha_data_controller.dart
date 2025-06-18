import 'package:common/component/feature/alpha_data/alpha_data_chip_frame.dart';
import 'package:common/component/feature/alpha_data/alpha_data_selection_frame.dart';
import 'package:common/component/feature/alpha_data/available_time_frame.dart';
import 'package:common/component/feature/alpha_data/disease_frame.dart';
import 'package:common/component/feature/alpha_data/key_height_frame.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlphaDataController extends GetxController {
  final SDUIUseCase sduiUseCase;
  final MembershipUseCase membershipUseCase;

  AlphaDataController(this.sduiUseCase, this.membershipUseCase);

  RxBool moveLoading = false.obs;

  RxList<InterestingKeywordType> typeList = <InterestingKeywordType>[].obs;

  void clickKeywordChip(
      InterestingKeywordType type, Function() addFailFunction) {
    if (typeList.contains(type)) {
      GAUtil.trackEvent(
        name: GAEventList.KEYWORD_DSELECT,
        params: {GAParameter.KEYWORD_NAME: type.koreanValue},
      );
      typeList.remove(type);
    } else {
      if (typeList.length <= 2) {
        GAUtil.trackEvent(
            name: GAEventList.KEYWORD_SELECT,
            params: {GAParameter.KEYWORD_NAME: type.koreanValue});
        typeList.add(type);
      } else {
        GAUtil.trackEvent(
            name: GAEventList.KEYWORD_SELECTION_ERROR,
            params: {GAParameter.ERROR_MESSAGE: '최대 3개만 고를 수 있어요'});
        addFailFunction();
      }
    }
  }

  bool isChipCheck(InterestingKeywordType type) => typeList.contains(type);

  bool isEnoughKeyWord() => typeList.isNotEmpty && typeList.length <= 3;

  ///
  /// SDUI
  ///
  final List<AlphaDataType> _alphaDataTypeList = AlphaDataType.values;
  RxList<SDUIItemModel> alphaDataList = <SDUIItemModel>[].obs;
  RxBool initAlphaDataLoading = false.obs;

  void initAlphaData({required Function() failFunction}) {
    initAlphaDataLoading.value = true;
    try {
      _getSDUIDataFunction((value) {
        _addAlphaDataList(value);
      }, failFunction);
    } catch (e) {
      ToastHandler().logicError();
      initAlphaDataLoading.value = false;
      failFunction();
    }
  }

  void _getSDUIDataFunction(
      Function(int) nextFunction, Function() failFunction) async {
    alphaDataList.clear();
    dynamic response =
        await sduiUseCase.getSDUI(typeList.map((e) => e.value).toList());
    if (response is SDUIModel) {
      for (dynamic data in response.sequence) {
        alphaDataList.add(SDUIItemModel.fromJson(data));
      }
      nextFunction(alphaDataList.length);
    } else {
      ErrorHandler.manageError(response.errorCode, Get.currentRoute,
          errorFunction: (code) {
        failFunction();
      });
    }
  }

  //알파데이터 추가
  void _addAlphaDataList(int length) {
    try{
      for (int idx = length; idx < _alphaDataTypeList.length + length; idx++) {
        AlphaDataType type = _alphaDataTypeList[idx - length];
        alphaDataList.add(SDUIItemModel(
          number: idx,
          keyword: type.keyword,
          data: [
            SDUIItemDetailModel(
                title: type.title, selection: type.selection, type: type.type),
          ],
        ));
      }
      initAlphaDataLoading.value = false;
      Get.toNamed(Routes.signUpAlpha);
    }catch(e){
      ToastHandler().logicError();
    }
  }

  ///
  /// Widget 만들기
  ///
  RxList<Widget> frameList = <Widget>[].obs;
  RxBool loading = true.obs;

  //title : value
  RxMap<String, dynamic> valueMap = <String, dynamic>{}.obs;

  //key : [title]
  RxMap<String, List<String>> keywordMap = <String, List<String>>{}.obs;

  void makeWidgetList(Function() moveFunction) {
    try{
      frameList.clear();
      loading.value = true;
      for (SDUIItemModel data in alphaDataList) {
        String keyword = data.keyword;
        for (SDUIItemDetailModel sd in data.data) {
          switch (sd.type) {
            case 'SELECT':
              frameList.add(Obx(() {
                return AlphaDataSelectionFrame(
                  title: sd.title,
                  dataList: sd.selection,
                  moveFunction: () {
                    moveFunction();
                  },
                  strongTitle: sd.strongTitle,
                  moveLoading: moveLoading.value,
                  setMoveLoading: (value) {
                    moveLoading.value = value;
                  },
                  valueMap: valueMap.value,
                  setValueMap: (value) {
                    valueMap[sd.title] = value;
                    valueMap.refresh();
                  },
                );
              }));
              _processKeyWordAndTitle(keyword, sd.title);
              break;
            case 'CHIP':
              frameList.add(Obx(() {
                return AlphaDataChipFrame(
                  title: sd.title,
                  dataList: sd.selection,
                  moveFunction: moveFunction,
                  strongTitle: sd.strongTitle,
                  valueMap: valueMap.value,
                  addDataToMap: (value) {
                    valueMap[sd.title].add(value);
                  },
                  removeDataFromMap: (value) {
                    valueMap[sd.title].remove(value);
                  },
                  setDataToMap: (value) {
                    valueMap[sd.title] = [value];
                  },
                  refreshMap: () {
                    valueMap.refresh();
                  },
                );
              }));
              _processKeyWordAndTitle(keyword, sd.title);
              break;
            case 'availableTime':
              frameList
                  .add(GetBuilder<AlphaDataController>(builder: (controller) {
                return AvailableTimeFrame(
                  moveFunction: () {
                    GAUtil.trackEvent(
                        name: GAEventList.NOTIFICATION_SETTINGS_SUBMIT,
                        params: {GAParameter.SELECTED_TIMES: _convertTime});
                    moveFunction();
                  },
                  availableTimeFunction: availableTimeFunction,
                  getAvailableListValue: getAvailableListValue,
                  availablePassCondition: availablePassCondition,
                  isDeprx: true,
                );
              }));
              break;
            case 'keyAndHeight':
              frameList.add(Obx(() {
                return KeyHeightFrame(
                    moveFunction: moveFunction,
                    height: height.value,
                    weight: weight.value,
                    setHeight: (value) {
                      height.value = value;
                    },
                    setWeight: (value) {
                      weight.value = value;
                    },
                    isDeprx: true);
              }));
              break;
            case 'disease':
              frameList.add(Obx(() {
                return DiseaseFrame(
                  moveFunction: () {
                    GAUtil.trackEvent(
                        name: GAEventList.MEDICAL_CONDITIONS_SUBMIT,
                        params: {
                          GAParameter.SELECTED_CONDITIONS:
                          diseaseList.map((e) => e.label).toList()
                        });
                    moveFunction();
                  },
                  diseaseFunction: diseaseFunction,
                  getDiseaseValue: getDiseaseValue,
                  diseaseList: diseaseList.value,
                  endAlphaDataLoading: endAlphaDataLoading.value,
                  addAdditionalData: addAdditionalData,
                );
              }));
              break;
            default:
              break;
          }
        }
      }
      update();
      loading.value = false;
    }catch(e){
      ToastHandler().logicError();
      loading.value = false;
    }
  }

  void _processKeyWordAndTitle(String keyword, String title) {
    try{
      if (keywordMap.containsKey(keyword)) {
        keywordMap[keyword]?.add(title);
      } else {
        keywordMap[keyword] = [title];
      }
      keywordMap.refresh();
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }

  ///
  /// Available tile
  ///
  List<List<bool>> availableList = <List<bool>>[
    //월요일
    [false, false, false, false],
    //화요일
    [false, false, false, false],
    //수요일
    [false, false, false, false],
    //목요일
    [false, false, false, false],
    //금요일
    [false, false, false, false],
    //토요일
    [false, false, false, false],
    //일요일
    [false, false, false, false]
  ];

  Map<String, List<String>> _convertTime() {
    return {
      '월': _convertTimeItem(availableList[0]),
      '화': _convertTimeItem(availableList[1]),
      '수': _convertTimeItem(availableList[2]),
      '목': _convertTimeItem(availableList[3]),
      '금': _convertTimeItem(availableList[4]),
      '토': _convertTimeItem(availableList[5]),
      '일': _convertTimeItem(availableList[6]),
    };
  }

  List<String> _convertTimeItem(List<bool> input) {
    List<String> result = [];
    try{
      if (input[0] == true) {
        result.add('오전');
      }
      if (input[1] == true) {
        result.add('오후');
      }
      if (input[2] == true) {
        result.add('저녁');
      }
      if (input[3] == true) {
        result.add('새벽');
      }
      return result;
    }catch(e){
      ToastHandler().logicError();
      return result;
    }
  }

  //true, false로
  void availableTimeFunction(DayOfWeekType type, TimeRangeType timeType) {
    try {
      bool current = getAvailableListValue(type, timeType);
      if (current) {
        GAUtil.trackEvent(name: GAEventList.NOTIFICATION_TIME_DSELECT, params: {
          GAParameter.DAY: type.korean,
          GAParameter.TIME_PERIOD: timeType.korean,
          GAParameter.CONTEXT: 'signup'
        });
      } else {
        GAUtil.trackEvent(name: GAEventList.NOTIFICATION_TIME_SELECT, params: {
          GAParameter.DAY: type.korean,
          GAParameter.TIME_PERIOD: timeType.korean,
          GAParameter.CONTEXT: 'signup'
        });
      }
      availableList[type.index][timeType.index] = !current;
      update();
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  bool getAvailableListValue(DayOfWeekType type, TimeRangeType timeType) =>
      availableList[type.index][timeType.index];

  //요일당 최소 하나
  bool availablePassCondition() {
    for (List<bool> data in availableList) {
      if (!data.contains(true)) {
        return false;
      }
    }
    return true;
  }

  ///
  /// disease
  ///
  RxList<DiseaseType> diseaseList = <DiseaseType>[].obs;

  void diseaseFunction(DiseaseType type) {
    try{
      if (type == DiseaseType.none) {
        if (diseaseList.contains(type)) {
          GAUtil.trackEvent(
              name: GAEventList.MEDICAL_CONDITION_DSELECT,
              params: {GAParameter.CONDITION_NAME: type.label});
          diseaseList.remove(type);
        } else {
          diseaseList.clear();
          GAUtil.trackEvent(
              name: GAEventList.MEDICAL_CONDITION_SELECT,
              params: {GAParameter.CONDITION_NAME: type.label});
          diseaseList.add(type);
        }
        diseaseList.refresh();
      } else {
        if (diseaseList.contains(DiseaseType.none)) {
          diseaseList.remove(DiseaseType.none);
        }
        if (diseaseList.contains(type)) {
          GAUtil.trackEvent(
              name: GAEventList.MEDICAL_CONDITION_DSELECT,
              params: {GAParameter.CONDITION_NAME: type.label});
          diseaseList.remove(type);
        } else {
          GAUtil.trackEvent(
              name: GAEventList.MEDICAL_CONDITION_SELECT,
              params: {GAParameter.CONDITION_NAME: type.label});
          diseaseList.add(type);
        }
        diseaseList.refresh();
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  bool getDiseaseValue(DiseaseType type) => diseaseList.contains(type);

  ///
  /// height and height
  ///
  RxString height = ''.obs;
  RxString weight = ''.obs;

  //_alphaDataTypeList

  late final List<String> _alphaDataKeyWordList =
      _alphaDataTypeList.map((e) => e.keyword).toList();
  RxBool endAlphaDataLoading = false.obs;

  void addAdditionalData(Function() successFunction) async {
    endAlphaDataLoading.value = true;
    List<TOVListEntity> tovList = [];
    AlphaDataEntity alphaDataModel = const AlphaDataEntity();
    for (String key in keywordMap.keys) {
      if (!_alphaDataKeyWordList.contains(key)) {
        List valueList = [];
        for (String title in keywordMap[key] ?? []) {
          valueList.add(valueMap[title]);
        }
        tovList.add(TOVListEntity(keyword: key, data: valueList));
      } else {
        dynamic value = valueMap[keywordMap[key]?.first ?? ''];
        alphaDataModel = addData(alphaDataModel, key, value);
      }
    }
    alphaDataModel = alphaDataModel.copyWith(
        height: int.parse(height.value),
        weight: int.parse(weight.value),
        availableTimes: availableList,
        disease: diseaseList.map((e) => e.label).toList());

    AdditionalDataEntity additionalDataModel =
        AdditionalDataEntity(tovList: tovList, alphaData: alphaDataModel);
    dynamic response =
        await membershipUseCase.addAdditionalData(additionalDataModel);
    try {
      if (response == true) {
        endAlphaDataLoading.value = false;
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e, s) {
      Log.e('$e\n$s');
      endAlphaDataLoading.value = false;
      ErrorHandler.manageError(response.errorCode, Get.currentRoute);
    }
  }

  AlphaDataEntity addData(AlphaDataEntity data, String key, dynamic value) {
    Map<String, dynamic> jsonData = data.toJson();
    if (jsonData.keys.contains(key)) {
      jsonData[key] = value;
      return AlphaDataEntity.fromJson(jsonData);
    } else {
      return data;
    }
  }
}
