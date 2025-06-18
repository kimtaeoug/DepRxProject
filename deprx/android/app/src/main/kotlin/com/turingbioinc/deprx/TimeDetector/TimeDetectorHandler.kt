package com.turingbioinc.deprx.TimeDetector
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import androidx.core.content.ContextCompat
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkRequest
import com.turingbioinc.deprx.Utils.Constants
import io.flutter.plugin.common.EventChannel


class TimeDetectorHandler(private val context: Context) : EventChannel.StreamHandler {
    private var receiver: BroadcastReceiver? = null
    private val LOG_TAG: String = "TimeDetectorHandler"
    override fun onListen(
        arguments: Any?,
        events: EventChannel.EventSink?
    ) {
        receiver = timeDetectorReceiver(events!!)
        registerAndEnqueueWorker()
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(receiver)
        receiver = null
    }

    private fun timeDetectorReceiver(event: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(
                context: Context?,
                intent: Intent?
            ) {
                val received = intent?.action
                if (received == Constants.TIME_DETECTOR_TAG) {
                    event.success("do")
                } else {
                    event.success("no")
                }
            }

        }
    }

    private fun registerAndEnqueueWorker() {
//        val request: WorkRequest = OneTimeWorkRequestBuilder<TimeDetectorWorker>().build()
//        WorkManager.getInstance(context).enqueue(request)
//        val intentFilter = IntentFilter(Constants.TIME_DETECTOR_TAG)
//        ContextCompat.registerReceiver(
//            context,
//            receiver,
//            intentFilter,
//            ContextCompat.RECEIVER_EXPORTED
//        )
//        val runnable = Runnable {
//            registerAndEnqueueWorker()
//        }
//        val handler = Handler(Looper.getMainLooper())
//        handler.postDelayed(runnable, 60000)
////        val delay12Hour: Long = 12 * 60 * 60 * 1000
////        handler.postDelayed(
////            runnable, delay12Hour
////        )


        val request: WorkRequest = OneTimeWorkRequestBuilder<TimeDetectorWorker>().build()
        WorkManager.getInstance(context).enqueue(request)
        val intentFilter = IntentFilter(Constants.TIME_DETECTOR_TAG)
        ContextCompat.registerReceiver(
            context,
            receiver,
            intentFilter,
            ContextCompat.RECEIVER_EXPORTED
        )
    }
}
