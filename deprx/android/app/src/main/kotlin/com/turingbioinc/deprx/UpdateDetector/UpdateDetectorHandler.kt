package com.turingbioinc.deprx.detector.UpdateDetector

import android.annotation.SuppressLint
import android.app.AlarmManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.icu.util.Calendar
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.core.content.getSystemService
import com.turingbioinc.deprx.Utils.Constants
import io.flutter.plugin.common.EventChannel

class UpdateDetectorHandler (private val context: Context) : EventChannel.StreamHandler {
    private var receiver: BroadcastReceiver? = null
    private val LOG_TAG: String = "UpdateDetectorHandler"
    override fun onListen(
        arguments: Any?,
        events: EventChannel.EventSink?
    ) {
        receiver = updateDetectorReceiver(events!!)
        //todo
    }

    @SuppressLint("ScheduleExactAlarm")
    @RequiresApi(Build.VERSION_CODES.N)
    private fun setAlarm(){
        val alarmManager : AlarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, UpdateDetectorReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(context, 0, intent,
            PendingIntent.FLAG_CANCEL_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val cal = Calendar.getInstance().apply {
            add(Calendar.SECOND, 30)
        }
        alarmManager.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, cal.timeInMillis, pendingIntent)

//        alarmManager.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, cal, pendingIntent)


//        alarmManager.setExactAndAllowWhileIdle()
//        val intent = Intent(context, updateDetectorReceiver)
//        alarmManager.setExactAndAllowWhileIdle()
//        val intent = Intent(this, AlarmRe)
        //        context.sendBroadcast(Intent(Constants.TIME_DETECTOR_TAG))
    }

    //    private fun setAlarm() {
    //        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
    //        val intent = Intent(this, AlarmReceiver::class.java)
    //        val pendingIntent = PendingIntent.getBroadcast(this, 0, intent, 0)
    //
    //        // 알람 시간 설정: 현재 시간으로부터 5초 후
    //        val calendar = Calendar.getInstance().apply {
    //            add(Calendar.SECOND, 5)
    //        }
    //
    //        // 알람 설정
    //        alarmManager.setExact(
    //            AlarmManager.RTC_WAKEUP,
    //            calendar.timeInMillis,
    //            pendingIntent
    //        )
    //
    //        Toast.makeText(this, "알람이 설정되었습니다!", Toast.LENGTH_SHORT).show()
    //    }
    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(receiver)
        receiver = null
    }
    private fun updateDetectorReceiver(event: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(
                context: Context?,
                intent: Intent?
            ) {
                val received = intent?.action
                if(received == Constants.UPDATE_DETECTOR_TAG){
                    event.success("do")
                }else{
                    event.success("no")
                }
            }

        }
    }
}