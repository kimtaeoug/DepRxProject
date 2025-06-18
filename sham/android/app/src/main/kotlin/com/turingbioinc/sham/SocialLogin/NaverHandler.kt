package com.turingbioinc.sham.SocialLogin

import android.R.id.message
import android.content.Context
import android.util.Log
import com.navercorp.nid.NaverIdLoginSDK
import com.navercorp.nid.oauth.NidOAuthLogin
import com.navercorp.nid.oauth.NidOAuthLoginState
import com.navercorp.nid.oauth.OAuthLoginCallback
import com.navercorp.nid.profile.NidProfileCallback
import com.navercorp.nid.profile.data.NidProfileMap
import com.turingbioinc.sham.Utils.Constants
import io.flutter.plugin.common.MethodChannel
import kotlin.collections.get

class NaverHandler() {
    val NAVER_CHANNEL_NAME: String = "NAVER"
    private fun loginCallBack(
        result: MethodChannel.Result,
    ): OAuthLoginCallback {
        return object : OAuthLoginCallback {
            override fun onError(errorCode: Int, message: String) {
                Log.e(NAVER_CHANNEL_NAME, "naverLogin onError")
                onFailure(errorCode, message)
            }

            override fun onFailure(httpStatus: Int, message: String) {
                Log.e(NAVER_CHANNEL_NAME, "naverLogin onFailure")
                val errorCode = NaverIdLoginSDK.getLastErrorCode().code
                val errorDescription = NaverIdLoginSDK.getLastErrorDescription()
                result.error(errorCode, errorDescription, message)
            }

            override fun onSuccess() {
                Log.i(NAVER_CHANNEL_NAME, "ONSUCCESS IS INVOKED")
                getProfileMap(result)
            }
        }
    }

    //modifier: Modifier = Modifier
    fun initNaver(arguments: Any?, context: Context, operation: () -> Unit = {}) {
        if (!NaverIdLoginSDK.isInitialized()) {
            if (arguments is Map<*, *>) {
                val clientId: String = arguments["client_id"].toString()
                val clientSecret: String = arguments["client_secret"].toString()
                val clientName: String = arguments["client_name"].toString()
                NaverIdLoginSDK.initialize(context, clientId, clientSecret, clientName)
                operation()
            } else {
                throw Exception("Argument Error")
            }
        } else {
            operation()
        }
    }


    fun loginProcess(result: MethodChannel.Result, context: Context) {
        try {
            Log.i(NAVER_CHANNEL_NAME, "naverLogin is invoked")
            val state: NidOAuthLoginState = NaverIdLoginSDK.getState()
            Log.i(NAVER_CHANNEL_NAME, "naverLogin is initialized State : ${state.name}")
            if (state.name.uppercase() != "OK") {
                NaverIdLoginSDK.authenticate(context, loginCallBack(result))
            } else {
                getProfileMap(result)
            }
        } catch (e: Exception) {
            Log.e(NAVER_CHANNEL_NAME, e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    fun logout(result: MethodChannel.Result) {
        try {
            Log.i(NAVER_CHANNEL_NAME, "logout is invoked")
            NaverIdLoginSDK.logout()
            result.success(true)

        } catch (e: Exception) {
            Log.e(NAVER_CHANNEL_NAME, e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    private val naverOAuthLogin: NidOAuthLogin = NidOAuthLogin()

    fun deleteTokenApi(result: MethodChannel.Result): OAuthLoginCallback {
        return object : OAuthLoginCallback {
            override fun onError(errorCode: Int, message: String) {
                Log.e(NAVER_CHANNEL_NAME, "Error Occured : $errorCode $message")
                onFailure(errorCode, message)
            }

            override fun onFailure(httpStatus: Int, message: String) {
                result.error(httpStatus.toString(), message, message.toString())
            }

            override fun onSuccess() {
                result.success(true)
            }
        };
    }

    fun closeConnection(
        result: MethodChannel.Result,
    ) {
        try {
            Log.i(NAVER_CHANNEL_NAME, "closeConnection is invoked in already initialized")
            var accessToken: String? =
                NaverIdLoginSDK.getAccessToken()
            if (accessToken != null) {
                naverOAuthLogin.callDeleteTokenApi(deleteTokenApi(result))
            }else{
                result.success(true)
            }

        } catch (e: Exception) {
            Log.e(NAVER_CHANNEL_NAME, e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    private fun profileCallback(methodChannelResult: MethodChannel.Result): NidProfileCallback<NidProfileMap> {
        return object : NidProfileCallback<NidProfileMap> {
            override fun onError(errorCode: Int, message: String) {
                onFailure(errorCode, message)
            }

            override fun onFailure(httpStatus: Int, message: String) {
                val description: String? = NaverIdLoginSDK.getLastErrorDescription()
                Log.i(NAVER_CHANNEL_NAME, "onError Occured : $httpStatus\nMessage : $message")
                methodChannelResult.error(
                    httpStatus.toString(),
                    message.toString(),
                    description.toString()
                )
            }

            override fun onSuccess(result: NidProfileMap) {
                Log.i(NAVER_CHANNEL_NAME, "onSuccess is Occured data : $result")
                val response = mapOf(
                    "code" to result.resultCode.toString(),
                    "message" to result.message.toString(),
                    "response" to result.profile.toString()
                )
                methodChannelResult.success(response)
            }
        }
    }

    fun getProfileMap(result: MethodChannel.Result) {
        Log.i(NAVER_CHANNEL_NAME, "getProfileMap is invoked")
        try {
            Log.i(NAVER_CHANNEL_NAME, "Naver sdk is already initialized")
            naverOAuthLogin.getProfileMap(profileCallback(result))
        } catch (e: Exception) {
            Log.e(NAVER_CHANNEL_NAME, e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    private fun reagreeCallback(result: MethodChannel.Result): OAuthLoginCallback {
        return object : OAuthLoginCallback {
            override fun onError(errorCode: Int, message: String) {
                onFailure(errorCode, message)
            }

            override fun onFailure(httpStatus: Int, message: String) {
                val description: String? = NaverIdLoginSDK.getLastErrorDescription()
                result.error(httpStatus.toString(), message, description)
            }

            override fun onSuccess() {
                result.success(true)
            }
        }
    }

    fun reagreeAuthenticate(context: Context, result: MethodChannel.Result) {
        try {
            NaverIdLoginSDK.reagreeAuthenticate(context, reagreeCallback(result))
        } catch (e: Exception) {
            Log.e(NAVER_CHANNEL_NAME, e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    companion object {
        private var INSTANCE: NaverHandler? = null
        fun getInstance(): NaverHandler {
            return INSTANCE ?: NaverHandler().apply {
                INSTANCE = this
            }
        }

    }
}