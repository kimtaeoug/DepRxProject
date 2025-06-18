package com.turingbioinc.deprx.detector

import android.app.Service
import android.app.Service.START_STICKY
import android.content.Intent
import android.os.IBinder

class LifeCycleService : Service() {

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onCreate() {
        super.onCreate()
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        super.onTaskRemoved(rootIntent)
        sendBroadcast(Intent("TASK_REMOVED"))
    }

    override fun onDestroy() {
        super.onDestroy()
        sendBroadcast(Intent("ON_DESTROY"))
    }


}