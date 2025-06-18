package com.turingbioinc.deprx

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.toString
import androidx.core.splashscreen.SplashScreen

class SplashHandler(private val splashScreen: SplashScreen?) : FlutterPlugin,
    MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "splash_handler")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
        if (call.method == "exit") {
            try {
                if(splashScreen != null){
                    splashScreen.setKeepOnScreenCondition {
                        false
                    }
                    result.success(true)
                }else{
                    result.success(true)
                }
            } catch (e: Error) {
                result.error("error", e.message, e.cause.toString())
            }
        }
    }
}
