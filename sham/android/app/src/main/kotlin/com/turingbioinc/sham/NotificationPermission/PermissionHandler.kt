package com.turingbioinc.sham.NotificationPermission

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import androidx.annotation.RequiresApi
import com.turingbioinc.sham.Utils.Constants.NOTIFICATION_PERMISSION
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class PermissionHandler(private val context: Context, private val activity: Activity) :
    FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, NOTIFICATION_PERMISSION)
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @RequiresApi(Build.VERSION_CODES.VANILLA_ICE_CREAM)
    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
        if (call.method == "check") {
            result.success(PermissionUtils.notificationPermissionStatus(context, activity))
        }else if(call.method == "appSetting"){
            openAppSettings()
        }else if(call.method == "notificationAppSetting"){
            openNotificationSettings()
        }
    }

    private fun openAppSettings() {
        val intent: Intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        val uri = Uri.fromParts("package", context.applicationContext.packageName, null)
        intent.data = uri
        context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }

    private fun openNotificationSettings() {
        val intent = if (PermissionUtils.notificationVersionCheck()) {
            Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).putExtra(
                Settings.EXTRA_APP_PACKAGE,
                context.applicationContext.packageName
            )
        } else {
            Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).setData(Uri.parse("package:${context.applicationContext.packageName}"))
        }
        context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }


}
