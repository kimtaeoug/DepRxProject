// import 'package:core/config/ga_parameter_list.dart';
// import 'package:core/utils/ga_util.dart';
//
// ///
// /// GAType - 기준 : Event
// ///
// enum GAType {
//   BackButtonClick,
//   GoogleLoginClick,
//   AppleLoginClick,
//   KakaoLoginClick,
//   NaverLoginClick,
//   IdLoginClick,
//   LoginButtonClick,
//   FindIdClick,
//   FindPasswordClick,
//   SignupClick,
//   FindIdView,
//   PhoneInputSubmit,
//   OtpResend,
//   OtpPageExit,
//   FindIdConfirmClick,
//   FindPasswordView,
//   FindPwdStep1Click,
//   FindPwdStep2Click,
//   PasswordResetView,
//   PasswordResetSubmit,
//   AuthCodeSubmit,
//   TermsSubmit,
//   IdInputSubmit,
//   PasswordChangeButtonClick,
//   NameSubmit,
//   GenderSelect,
//   BirthdateSubmit,
//   AddressInputSubmit,
//   ReviewScreenView,
//   EditNameClick,
//   EditGenderBirthdateClick,
//   EditAddressClick,
//   EditPhoneClick,
//   ReviewSubmit,
//   KeywordSelectionScreenView,
//   KeywordSelect,
//   KeywordDeselect,
//   KeywordSelectionError,
//   KeywordSubmit,
//   NotificationSettingsView,
//   ToggleNotification,
//   NotificationTimeSelect,
//   NotificationTimeDeselect,
//   NotificationSettingsSubmit,
//   HeightWeightView,
//   HeightInputSubmit,
//   WeightInputSubmit,
//   HeightWeightSubmit,
//   MedicalConditionsView,
//   MedicalConditionSelect,
//   MedicalConditionDeselect,
//   MedicalConditionsSubmit,
//   SignupCompletionView,
//   SignupCompleteButtonClick,
//   ServiceOnboardingExit,
//   ServiceOnboardingComplete,
//   ReportOnboardingExit,
//   ReportOnboardingComplete,
//   RewardOnboardingExit,
//   RewardOnboardingComplete,
//   MoodSelectionView,
//   MoodSliderInteract,
//   MoodSelected,
//   MoodSelectionExit,
//   BdiResultSelectionView,
//   BdiAutoWaitClick,
//   BdiManualClick,
//   BdiSelectionExit,
//   BdiAutoLoadingView,
//   BdiAutoLoadingExit,
//   BdiAutoLoadingComplete,
//   BdiAutoCompleteView,
//   StartAfterBdiCompleteClick,
//   KbadsIntroView,
//   KbadsIntroExit,
//   KbadsStartClick,
//   KbadsQuestionView,
//   KbadsQuestionResponse,
//   KbadsQuestionExit,
//   KbadsCompletionPopupView,
//   KbadsSubmitConfirmClick,
//   KbadsSubmitCancelClick,
//   BaSelectionView,
//   BaSelectClick,
//   BaDeselectClick,
//   BaSelectionError,
//   BaNextClick,
// }
//
// extension GATypeExtension on GAType {
//   String get eventName => name;
//
//   //GAParameterList
//   List<String> get parameter {
//     switch (this) {
//       case GAType.BackButtonClick:
//         return [
//           GAParameterList.SCREEN_NAME,
//           GAParameterList.PREVIOUS_SCREEN,
//           GAParameterList.BUTTON_NAME
//         ];
//       case GAType.GoogleLoginClick:
//         return [GAParameterList.LOGIN_PROVIDER];
//       case GAType.AppleLoginClick:
//         return [GAParameterList.LOGIN_PROVIDER];
//       case GAType.KakaoLoginClick:
//         return [GAParameterList.LOGIN_PROVIDER];
//       case GAType.NaverLoginClick:
//         return [GAParameterList.LOGIN_PROVIDER];
//       case GAType.IdLoginClick:
//         return [GAParameterList.LOGIN_METHOD];
//       case GAType.LoginButtonClick:
//         return [];
//       case GAType.FindIdClick:
//         return [];
//       case GAType.FindPasswordClick:
//         return [];
//       case GAType.SignupClick:
//         return [];
//       case GAType.FindIdView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.PhoneInputSubmit:
//         return [GAParameterList.PHONE_NUMBER];
//       case GAType.OtpResend:
//         return [GAParameterList.ATTEMP_COUNT];
//       case GAType.OtpPageExit:
//         return [];
//       case GAType.FindIdConfirmClick:
//         return [GAParameterList.BUTTON_NAME, GAParameterList.SCREEN_NAME];
//       case GAType.FindPasswordView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.FindPwdStep1Click:
//         return [GAParameterList.SCREEN_NAME, GAParameterList.BUTTON_NAME];
//       case GAType.FindPwdStep2Click:
//         return [GAParameterList.SCREEN_NAME, GAParameterList.BUTTON_NAME];
//       case GAType.PasswordResetView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.PasswordResetSubmit:
//         return [GAParameterList.SUCCESS];
//       case GAType.AuthCodeSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.TermsSubmit:
//         return [GAParameterList.ALL_CHECKED];
//       case GAType.IdInputSubmit:
//         return [GAParameterList.SUCCESS];
//       case GAType.PasswordChangeButtonClick:
//         return [GAParameterList.ATTEMP_COUNT];
//       case GAType.NameSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.GenderSelect:
//         return [GAParameterList.GENDER];
//       case GAType.BirthdateSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.AddressInputSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.ReviewScreenView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.EditNameClick:
//         return [GAParameterList.FIELD_NAME];
//       case GAType.EditGenderBirthdateClick:
//         return [GAParameterList.FIELD_NAME];
//       case GAType.EditAddressClick:
//         return [GAParameterList.FIELD_NAME];
//       case GAType.EditPhoneClick:
//         return [GAParameterList.FIELD_NAME];
//       case GAType.ReviewSubmit:
//         return [GAParameterList.SCREEN_NAME, GAParameterList.SUCCESS];
//       case GAType.KeywordSelectionScreenView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.KeywordSelect:
//         return [GAParameterList.KEYWORD_NAME];
//       case GAType.KeywordDeselect:
//         return [GAParameterList.KEYWORD_NAME];
//       case GAType.KeywordSelectionError:
//         return [GAParameterList.ERROR_MESSAGE];
//       case GAType.KeywordSubmit:
//         return [GAParameterList.SELECTED_KEYWORDS_COUNT];
//       case GAType.NotificationSettingsView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.ToggleNotification:
//         return [GAParameterList.TOGGLE_STATUS];
//       case GAType.NotificationTimeSelect:
//         return [GAParameterList.DAY, GAParameterList.TIME_PERIOD];
//       case GAType.NotificationTimeDeselect:
//         return [GAParameterList.DAY, GAParameterList.TIME_PERIOD];
//       case GAType.NotificationSettingsSubmit:
//         return [GAParameterList.SELECTED_DAYS, GAParameterList.SELECTED_TIMES];
//       case GAType.HeightWeightView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.HeightInputSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.WeightInputSubmit:
//         return [GAParameterList.INPUT_VALUE];
//       case GAType.HeightWeightSubmit:
//         return [
//           GAParameterList.HEIGHT,
//           GAParameterList.WEIGHT,
//           GAParameterList.SUCCESS
//         ];
//       case GAType.MedicalConditionsView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.MedicalConditionSelect:
//         return [GAParameterList.CONDITION_NAME];
//       case GAType.MedicalConditionDeselect:
//         return [GAParameterList.CONDITION_NAME];
//       case GAType.MedicalConditionsSubmit:
//         return [GAParameterList.SELECTED_CONDITIONS];
//       case GAType.SignupCompletionView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.SignupCompleteButtonClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.ServiceOnboardingExit:
//         return [];
//       case GAType.ServiceOnboardingComplete:
//         return [];
//       case GAType.ReportOnboardingExit:
//         return [];
//       case GAType.ReportOnboardingComplete:
//         return [];
//       case GAType.RewardOnboardingExit:
//         return [];
//       case GAType.RewardOnboardingComplete:
//         return [];
//       case GAType.MoodSelectionView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.MoodSliderInteract:
//         return [GAParameterList.MOOD_VALUE];
//       case GAType.MoodSelected:
//         return [GAParameterList.MOOD_VALUE];
//       case GAType.MoodSelectionExit:
//         return [];
//       case GAType.BdiResultSelectionView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.BdiAutoWaitClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.BdiManualClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.BdiSelectionExit:
//         return [];
//       case GAType.BdiAutoLoadingView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.BdiAutoLoadingExit:
//         return [];
//       case GAType.BdiAutoLoadingComplete:
//         return [GAParameterList.SUCCESS];
//       case GAType.BdiAutoCompleteView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.StartAfterBdiCompleteClick:
//         return [GAParameterList.SCREEN_NAME, GAParameterList.BUTTON_NAME];
//       case GAType.KbadsIntroView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.KbadsIntroExit:
//         return [];
//       case GAType.KbadsStartClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.KbadsQuestionView:
//         return [GAParameterList.QUESTION_ID];
//       case GAType.KbadsQuestionResponse:
//         return [GAParameterList.QUESTION_ID, GAParameterList.RESPONSE_VALUE];
//       case GAType.KbadsQuestionExit:
//         return [GAParameterList.QUESTION_ID, GAParameterList.EXIT_REASON];
//       case GAType.KbadsCompletionPopupView:
//         return [GAParameterList.SCREEN_NAME];
//       case GAType.KbadsSubmitConfirmClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.KbadsSubmitCancelClick:
//         return [GAParameterList.BUTTON_NAME];
//       case GAType.BaSelectionView:
//         return [GAParameterList.WEEK, GAParameterList.DAY];
//       case GAType.BaSelectClick:
//         return [GAParameterList.ACTIVITY_NAME];
//       case GAType.BaDeselectClick:
//         return [GAParameterList.ACTIVITY_NAME];
//       case GAType.BaSelectionError:
//         return [GAParameterList.ERROR_MESSAGE];
//       case GAType.BaNextClick:
//         return [GAParameterList.WEEK, GAParameterList.DAY];
//     }
//   }
//
// }
