package com.turingbioinc.deprx.SocialLogin

import android.content.Context
import com.turingbioinc.deprx.Utils.Constants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.DelicateCoroutinesApi

class KakaoLogin(private val context: Context) : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private val kakaoHandler: KakaoHandler = KakaoHandler.getInstance()
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, kakaoHandler.KAKAO_CHANNEL_NAME)
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
        val arguments: Any? = call.arguments
        when (method) {
            Constants.LOGIN -> kakaoHandler.login(context, result)
            Constants.LOGOUT -> kakaoHandler.logout(result)
            Constants.CLOSE_CONNECTION -> kakaoHandler.closeConnection(result)
            Constants.PROFILE -> kakaoHandler.getProfileMap(result)
        }
    }

}
