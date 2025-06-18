package com.turingbioinc.sham.detector

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class LifeCycleReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        val received = intent?.action
        if (received == "TASK_REMOVED") {

        } else if (received == "ON_DESTROY") {

        }
    }
}

