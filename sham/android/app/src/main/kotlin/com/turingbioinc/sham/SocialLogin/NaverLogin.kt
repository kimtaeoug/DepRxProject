package com.turingbioinc.sham.SocialLogin

import android.content.Context
import android.content.Intent
import android.net.Uri
import com.turingbioinc.sham.Utils.Constants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.DelicateCoroutinesApi

class NaverLogin(private val context: Context) : FlutterPlugin,
    MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel

    private val naverHandler: NaverHandler = NaverHandler.getInstance()


    val NAVER_PACKAGE: String = "com.nhn.android.search"

    fun checkNaverApp(): Boolean {
        val installApp = context.packageManager.getLaunchIntentForPackage(NAVER_PACKAGE)
        if (installApp == null) {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse("market://details?id=$NAVER_PACKAGE")
            context.startActivity(intent)
            return false
        }
        return true
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, naverHandler.NAVER_CHANNEL_NAME)
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @OptIn(DelicateCoroutinesApi::class)
    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result
    ) {
        val method: String = call.method
        when (method) {
            Constants.LOGIN -> naverHandler.loginProcess(result, context)
            Constants.LOGOUT -> naverHandler.logout(result)
            Constants.CLOSE_CONNECTION -> naverHandler.closeConnection(result)
            Constants.PROFILE -> naverHandler.getProfileMap(result)
            Constants.REAGREE -> naverHandler.reagreeAuthenticate(context, result)
        }
    }
}