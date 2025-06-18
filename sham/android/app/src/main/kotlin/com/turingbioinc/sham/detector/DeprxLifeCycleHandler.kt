package com.turingbioinc.sham.detector

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.EventChannel

class DeprxLifeCycleHandler(private val context: Context) : EventChannel.StreamHandler {
    private var receiver: BroadcastReceiver? = null

    @Suppress("UnspecifiedRegisterReceiverFlag")
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onListen(
        arguments: Any?,
        events: EventChannel.EventSink?
    ) {
        receiver = lifeCycleReceiver(events!!)
//        val intentFilter = IntentFilter(Constants.TIME_DETECTOR_TAG)
//        ContextCompat.registerReceiver(context, receiver, intentFilter, ContextCompat.RECEIVER_EXPORTED)
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(receiver)
        receiver = null
    }


    private fun lifeCycleReceiver(event: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(
                context: Context?,
                intent: Intent?
            ) {
                val received = intent?.action
                if (received == "TASK_REMOVED") {
                    event.success(0)
                } else if (received == "ON_DESTROY") {
                    event.success(1)
                } else {
                    event.success(2)
                }
            }

        }
    }
}
