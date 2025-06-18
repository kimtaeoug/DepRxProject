import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateUtil{
 // final AppUpdateInfo _appUpdateInfo = AppUpdateInfo();
 Future<AppUpdateInfo> checkUpdate()async{
   return InAppUpdate.checkForUpdate();
 }
 void immediateUpdate()async{
   await InAppUpdate.performImmediateUpdate();
 }
 void startUpdate()async{
   await InAppUpdate.startFlexibleUpdate();
 }
 void completeUpdate()async{
   await InAppUpdate.completeFlexibleUpdate();
 }

 void update()async{
   AppUpdateInfo value = await checkUpdate();

   //todo
   // Log.e('update is invoked');
   // MethodChannel methodChannel = const MethodChannel('update');
   // await methodChannel.invokeMethod('update');
 }
}