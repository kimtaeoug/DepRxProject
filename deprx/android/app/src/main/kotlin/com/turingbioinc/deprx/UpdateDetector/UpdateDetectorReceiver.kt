package com.turingbioinc.deprx.detector.UpdateDetector

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.turingbioinc.deprx.Utils.Constants

class UpdateDetectorReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        context?.sendBroadcast(Intent(Constants.UPDATE_DETECTOR_TAG))
    }
}