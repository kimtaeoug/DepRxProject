package com.turingbioinc.sham.NotificationPermission
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat

class PermissionUtils {
    companion object {
        fun notificationVersionCheck(): Boolean {
            return Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
        }

        @RequiresApi(Build.VERSION_CODES.VANILLA_ICE_CREAM)
        fun notificationPermissionStatus(context: Context, activity: Activity): String {
            if (hasNotificationPermission(context)) {
                return "granted";
            } else {
                val permant: Boolean =
                    activity.shouldShowRequestPermissionRationale(android.Manifest.permission.POST_NOTIFICATIONS)
                if (!permant) {
                    return "permanent";
                } else {
                    return "denied"
                }
            }
        }


        fun hasNotificationPermission(context: Context): Boolean {
            return if (notificationVersionCheck()) {
                ContextCompat.checkSelfPermission(
                    context, android.Manifest.permission.POST_NOTIFICATIONS
                ) == PackageManager.PERMISSION_GRANTED
            } else {
                true
            }
        }
    }
}