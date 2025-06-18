import 'package:get/get.dart';

///
/// 알파 데이터
/// residence : 거주 (도심, 교외)
/// detailResidence : 거주 타입(아파트, 빌라, 단독주택)
/// pet : 반려 동물
/// availableTime : 가용 시간
/// howMuchExercise : 운동을 얼마나
/// intensityOfExercise : 운동 강도
/// exerciseTime : 운동 시간
/// keyAndHeight : 키, 체중
/// smoke : 흡연
/// howMuchDrink : 주에 음주 얼마나
/// drinkCarriage : 음주량
/// howMuchMorning : 주에 아침 얼마나
///  disease : 질병
///
enum AlphaDataType {
  residence,
  detailResidence,
  pet,
  availableTime,
  howMuchExercise,
  intensityOfExercise,
  exerciseTime,
  keyAndHeight,
  smoke,
  howMuchDrink,
  drinkCarriage,
  howMuchMorning,
  disease
}

extension AlphaDataTypeExtension on AlphaDataType {
  String get type {
    if (this == AlphaDataType.availableTime) {
      return 'availableTime';
    } else if (this == AlphaDataType.keyAndHeight) {
      return 'keyAndHeight';
    } else if (this == AlphaDataType.disease) {
      return 'disease';
    } else {
      return 'SELECT';
    }
  }

  String get title {
    switch (this) {
      case AlphaDataType.residence:
        return '현재 어디에 거주하고 계시나요?';
      case AlphaDataType.detailResidence:
        return '현재 어디에 거주하고 계시나요?';
      case AlphaDataType.pet:
        return '반려 동물이 있으신가요?';
      case AlphaDataType.availableTime:
        return 'availableTime_overview_title'.tr;
      case AlphaDataType.howMuchExercise:
        return '운동을 얼마나 하시나요?';
      case AlphaDataType.intensityOfExercise:
        return '운동의 강도는?';
      case AlphaDataType.exerciseTime:
        return '1회당 평균 운동 시간은?';
      case AlphaDataType.keyAndHeight:
        return 'body_overview_title'.tr;
      case AlphaDataType.smoke:
        return '흡연을 하시나요?';
      case AlphaDataType.howMuchDrink:
        return '1주일에 음주를 어느정도 하시나요?';
      case AlphaDataType.drinkCarriage:
        return '1회당 음주량이 어느정도 인가요?';
      case AlphaDataType.howMuchMorning:
        return '1주일에 아침을 먹는 날은?';
      case AlphaDataType.disease:
        return 'disease_overview_title'.tr;
    }
  }

  List<String> get selection {
    switch (this) {
      case AlphaDataType.residence:
        return ['도심', '교외'];
      case AlphaDataType.detailResidence:
        return ['아파트', '빌라', '단독주택'];
      case AlphaDataType.pet:
        return ['강아지', '고양이', '그 외', '없음'];
      case AlphaDataType.availableTime:
        return [];
      case AlphaDataType.howMuchExercise:
        return ['안 함', '주 1 - 2회', '주 3 - 6회', '매일'];
      case AlphaDataType.intensityOfExercise:
        return ['상', '중', '하'];
      case AlphaDataType.exerciseTime:
        return [
          '10분',
          '10분 ~ 30분',
          '30분 ~ 1시간',
          '1시간 ~ 1시간30분',
          '1시간 30분 ~ 2시간',
          '2시간 이상'
        ];
      case AlphaDataType.keyAndHeight:
        return [];
      case AlphaDataType.smoke:
        return ['common_ctaBtn_yes'.tr, 'common_ctaBtn_no'.tr, '금연중'];
      case AlphaDataType.howMuchDrink:
        return ['안함', '1회', '2 - 3회', '4 - 7회', '8회 이상'];
      case AlphaDataType.drinkCarriage:
        return ['1병 미만', '1 ~ 2병', '2병 이상'];
      case AlphaDataType.howMuchMorning:
        return ['거의 없다', '1 - 2번', '3번 이상', '매일'];
      case AlphaDataType.disease:
        return [];
    }
  }
  String get keyword{
    switch(this){
      case AlphaDataType.residence:
        return 'locationType';
      case AlphaDataType.detailResidence:
        return 'residenceType';
      case AlphaDataType.pet:
        return 'petType';
      case AlphaDataType.availableTime:
        return 'availableTimes';
      case AlphaDataType.howMuchExercise:
        return 'exerciseFrequency';
      case AlphaDataType.intensityOfExercise:
        return 'exerciseIntensity';
      case AlphaDataType.exerciseTime:
        return 'exerciseTimes';
      case AlphaDataType.keyAndHeight:
        return 'keyAndHeight';
      case AlphaDataType.smoke:
        return 'smokingStatus';
      case AlphaDataType.howMuchDrink:
        return 'drinkFrequency';
      case AlphaDataType.drinkCarriage:
        return 'drinkAmount';
      case AlphaDataType.howMuchMorning:
        return 'breakfastFrequency';
      case AlphaDataType.disease:
        return 'disease';
    }
  }
}
