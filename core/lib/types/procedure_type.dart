// import 'package:deprx/app/utils/procedure_util.dart';
// import 'package:deprx/data/model/procedure/procedure_model.dart';
//
// enum ProcedureType {
//   membership,
//   education,
//   today,
//   kbads,
//   reward2WeekSelect,
//   reward2WeekPickUp,
//   pickUpReward,
//   report,
//   actionSelect,
//   rewardSelect,
//   //8주차 flow
//   finalKbads,
//   reward8PickUp,
//   finalReward,
//   finalReport,
//   last,
// }
//
// extension ProcedureTypeExtension on ProcedureType {
//   static Future<bool> routing(ProcedureType type, ProcedureModel data,
//       {dynamic entityData}) async {
//     final ProcedureUtil util = ProcedureUtil(data: data);
//     switch (type) {
//       case ProcedureType.membership:
//         return await util.checkMembershipProcess();
//       case ProcedureType.education:
//         return await util.checkEducation();
//       case ProcedureType.today:
//         return await util.checkToday();
//       case ProcedureType.kbads:
//         return await util.checkKBADS();
//       case ProcedureType.pickUpReward:
//         return await util.checkRewardPickUp(entityData);
//       case ProcedureType.report:
//         return await util.checkReport(entityData);
//       case ProcedureType.actionSelect:
//         return await util.checkActionSelection(entityData);
//       case ProcedureType.rewardSelect:
//         return await util.checkAlreadyRewardSelection(entityData);
//       case ProcedureType.last:
//         return await util.goHome();
//       case ProcedureType.reward2WeekSelect:
//         return await util.check2WeekReward(entityData);
//       case ProcedureType.reward2WeekPickUp:
//         return await util.check2WeekRewardPickUp(entityData);
//       //8주차 Flow
//       case ProcedureType.finalKbads:
//         return await util.checkFinalKBADS();
//       case ProcedureType.finalReward:
//         return await util.checkFinalReward();
//       case ProcedureType.reward8PickUp:
//         return await util.checkReward8PickUp(entityData);
//       case ProcedureType.finalReport:
//         return await util.checkFinalReport(entityData);
//     }
//   }
// }
