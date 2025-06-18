package com.turingbioinc.sham.Utils

import com.orhanobut.logger.AndroidLogAdapter
import com.orhanobut.logger.Logger
class DLog(private var logTag: String = Constants.DEFAULT_TAG) {
    fun getInstance(): DLog {
        Logger.addLogAdapter(AndroidLogAdapter())
        return this
    }

    fun debug(s: String): DLog {
        Logger.t(logTag).d(s)
        return this
    }

    fun info(s: String): DLog {
        Logger.t(logTag).i(s)
        return this
    }

    fun warning(s: String): DLog {
        Logger.t(logTag).w(s)
        return this
    }

    fun error(s: String): DLog {
        Logger.t(logTag).e(s)
        return this
    }
}