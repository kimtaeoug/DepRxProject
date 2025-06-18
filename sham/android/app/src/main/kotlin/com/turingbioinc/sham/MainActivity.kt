package com.turingbioinc.sham

import android.os.Bundle
import androidx.core.splashscreen.SplashScreen
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import androidx.lifecycle.LifecycleObserver
import com.kakao.sdk.common.KakaoSdk
import com.navercorp.nid.NaverIdLoginSDK
import com.turingbioinc.sham.NotificationPermission.PermissionHandler
import com.turingbioinc.sham.SocialLogin.KakaoLogin
import com.turingbioinc.sham.SocialLogin.NaverLogin
import com.turingbioinc.sham.TimeDetector.TimeDetectorHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity(), LifecycleObserver {
    private var splashScreen: SplashScreen? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        splashScreen = installSplashScreen().apply {
            setKeepOnScreenCondition {
                true
            }
        }
        KakaoSdk.init(context, BuildConfig.KAKAO_KEY)
        initNaver()
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngine.plugins.add(SplashHandler(splashScreen))
        flutterEngine.plugins.add(NaverLogin(context))
        flutterEngine.plugins.add(KakaoLogin(context))
        flutterEngine.plugins.add(PermissionHandler(context, activity))
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "time_detector").setStreamHandler(
            TimeDetectorHandler(this.context)
        )
    }

    private fun initNaver(){
        NaverIdLoginSDK.initialize(
            context,
            BuildConfig.NAVER_KEY,
            BuildConfig.NAVER_SECRET_KEY,
            BuildConfig.NAVER_CLIENT_ID
        )
        NaverIdLoginSDK.showDevelopersLog(true)
        NaverIdLoginSDK.isShowMarketLink = true
    }

}
