package com.example.house_example

import android.app.Activity
import com.umeng.analytics.MobclickAgent
import com.umeng.commonsdk.UMConfigure
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object UmengPrivacyHandler {
    fun handle(call: MethodCall, result: MethodChannel.Result, activity: Activity) {
        val isAgreed: Boolean? = call.argument<Boolean>("isAgreed")
        if (isAgreed == null) {
            result.error("INVALID_ARGUMENT", "isAgreed参数不能为空", null)
            return
        }
        UMConfigure.submitPolicyGrantResult(activity, isAgreed)
        if (isAgreed) {

            // 初始化友盟统计
            UMConfigure.init(activity, "68340e64bc47b67d83727fae", "HUAWEI", UMConfigure.DEVICE_TYPE_PHONE, null)
            MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.AUTO)


////             初始化友盟推送
//            val pushAgent = PushAgent.getInstance(activity)
//            pushAgent.register(object : com.umeng.message.IUmengRegisterCallback {
//                override fun onSuccess(deviceToken: String) {
//                    // 注册成功
//                    println("友盟推送注册成功，deviceToken: $deviceToken")
//
//
//                }
//                override fun onFailure(s: String, s1: String) {
//                    // 终端打印详细信息
//                    println("register failed! " + "code:" + s + ",desc:" + s1);
//
//                }
//            })

        }
        result.success(null)
    }
}
