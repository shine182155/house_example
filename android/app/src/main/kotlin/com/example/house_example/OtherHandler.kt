package com.example.house_example

import android.app.Activity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object OtherHandler {
    fun handle(call: MethodCall, result: MethodChannel.Result, activity: Activity) {
        // 可根据 call 获取参数
        result.success("OtherHandler 已被调用")
    }
}
