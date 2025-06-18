package com.turingbioinc.deprx.SocialLogin

import android.content.Context
import android.util.Log
import com.kakao.sdk.auth.AuthApiClient
import com.kakao.sdk.auth.model.OAuthToken
import com.kakao.sdk.auth.model.Prompt
import com.kakao.sdk.common.model.ClientError
import com.kakao.sdk.common.model.ClientErrorCause
import com.kakao.sdk.user.UserApiClient
import com.kakao.sdk.user.model.User
import io.flutter.plugin.common.MethodChannel
import com.turingbioinc.deprx.Utils.Constants
import com.turingbioinc.deprx.Utils.DLog

class KakaoHandler {
    val KAKAO_CHANNEL_NAME = "KAKAO"
    private val userInstance: UserApiClient = UserApiClient.instance
    private val authInstance: AuthApiClient = AuthApiClient.instance


    private fun kakaoAccountLoginCallBack(result: MethodChannel.Result): (OAuthToken?, Throwable?) -> Unit {
        return { token, error ->
            if (error != null) {
                log.error(error.toString())
                result.error(Constants.UNEXPECTED, error.message, error.cause)
            } else {
                if (token != null) {
                    getProfileMap(result)
                } else {
                    Log.e(KAKAO_CHANNEL_NAME, "Token is null")
                    result.error(Constants.UNEXPECTED, "Token is null", token.toString())
                }
            }
        }
    }

    private fun kakaoLoginCallBack(
        context: Context,
        result: MethodChannel.Result
    ): (OAuthToken?, Throwable?) -> Unit {
        return { token, error ->
            if (error != null) {
                log.error(error.message + error.cause)
                if (error is ClientError && error.reason == ClientErrorCause.Cancelled) {
                    result.success("cancelByUser")
                }
                log.error("loginWithKakaoAccount is invoked")
                userInstance.loginWithKakaoAccount(
                    context,
                    callback = kakaoAccountLoginCallBack(result)
                )
            } else {
                if (token != null) {
                    log.info("getProfileMap is invoked in kakaoLoginCallback")
                    getProfileMap(result)
                } else {
                    log.error("Token is null")
                    result.error(Constants.UNEXPECTED, "Token is null", token.toString())
                }
            }
        }
    }

    //modifier: Modifier = Modifier
    fun login(context: Context, result: MethodChannel.Result, force: Boolean = false) {
        try {
            if (force == false) {
                if (userInstance.isKakaoTalkLoginAvailable(context)) {
                    userInstance.loginWithKakaoTalk(
                        context,
                        callback = kakaoLoginCallBack(context, result),
                    )
                } else {
                    userInstance.loginWithKakaoAccount(
                        context,
                        callback = kakaoAccountLoginCallBack(result),
                        prompts = listOf(Prompt.SELECT_ACCOUNT)
                    )
                }
            } else {
                log.info("Hello2")
                userInstance.loginWithKakaoAccount(
                    context,
                    callback = kakaoAccountLoginCallBack(result),
                    prompts = listOf(Prompt.LOGIN, Prompt.SELECT_ACCOUNT)
                )
            }
        } catch (e: Exception) {
            log.error(e.toString())
            closeConnection(result)
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    fun logout(result: MethodChannel.Result) {
        try {
            if(authInstance.hasToken()){
                userInstance.logout { error ->
                    if (error != null) {
                        throw Exception(error)
                    } else {
                        result.success(true)
                    }
                }
            }else{
                result.success(true)
            }
        } catch (e: Exception) {
            log.error(e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    fun closeConnection(result: MethodChannel.Result) {
        try {
            if(authInstance.hasToken()){
                userInstance.unlink { error ->
                    if (error != null) {
                        if(error.message?.contains("invalid_grant") == true){
                            logout(result)
                        }else{
                            log.error(error.toString())
                            throw Exception(error)
                        }
                    } else {
                        result.success(true)
                    }
                }
            }else{
                result.success(true)
            }
        } catch (e: Exception) {
            log.error(e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }

    private fun profileCallBack(result: MethodChannel.Result): (User?, Throwable?) -> Unit {
        return { user, error ->
            if (error != null) {
                log.error(error.toString())
                result.error(Constants.UNEXPECTED, error.message, error.cause)
            } else {
                if (user != null) {
                    log.info("USER : $user")
                    var response = mapOf(
                        "userId" to user.id.toString()
                    )
                    result.success(response)
                } else {
                    log.error("USER ERROR!!!!")
                    result.error(Constants.UNEXPECTED, "User is null", user.toString())
                }
            }
        }
    }

    fun getProfileMap(result: MethodChannel.Result) {
        try {
            userInstance.me(callback = profileCallBack(result), secureResource = false)
        } catch (e: Exception) {
            log.error(e.toString())
            result.error(Constants.UNEXPECTED, e.message, e.cause)
        }
    }


    companion object {
        private var INSTANCE: KakaoHandler? = null
        private val log: DLog = DLog(logTag = "KAKAO").getInstance()
        fun getInstance(): KakaoHandler {
            return INSTANCE ?: KakaoHandler().apply {
                INSTANCE = this
            }
        }
    }
}