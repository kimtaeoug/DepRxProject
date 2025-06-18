package com.turingbioinc.deprx.sham.UpdateDetector

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.turingbioinc.sham.Utils.Constants

class UpdateDetectorReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        context?.sendBroadcast(Intent(Constants.UPDATE_DETECTOR_TAG))
    }
}