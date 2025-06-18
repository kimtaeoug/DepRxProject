package com.turingbioinc.deprx.TimeDetector

import android.content.Context
import android.content.Intent
import android.icu.util.Calendar
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.turingbioinc.deprx.Utils.Constants
import com.turingbioinc.deprx.Utils.DLog
import kotlinx.coroutines.coroutineScope

class TimeDetectorWorker(private val context: Context, workerParams: WorkerParameters) :
    CoroutineWorker(context, workerParams) {
    @RequiresApi(Build.VERSION_CODES.N)
    override suspend fun doWork(): Result = coroutineScope {
        val calendar : Calendar = Calendar.getInstance()
        try {
            if (calendar.get(Calendar.PM) == 12 ) {
                val intent: Intent = Intent(Constants.TIME_DETECTOR_TAG)
                context.sendBroadcast(intent)
                Result.success()
            } else {
                Result.failure()
            }
        } catch (e: Error) {
            DLog().error(e.toString())
            Result.failure();
        }
    }
}

