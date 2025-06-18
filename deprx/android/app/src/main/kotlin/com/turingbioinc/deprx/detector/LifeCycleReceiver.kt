package com.turingbioinc.deprx.detector

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.EventChannel

class LifeCycleReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        val received = intent?.action
        if (received == "TASK_REMOVED") {

        } else if (received == "ON_DESTROY") {

        }
    }
}

