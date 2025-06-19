package com.example.house_example

import android.content.Intent
import android.net.Uri
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity

object DialPhoneNumberHandler {
    fun handle(call: MethodCall, result: MethodChannel.Result, activity: FlutterActivity) {
        val phoneNumber = call.argument<String>("phoneNumber")
        if (phoneNumber.isNullOrEmpty()) {
            result.error("INVALID_NUMBER", "电话号码不能为空", null)
            return
        }
        try {
            val intent = Intent(Intent.ACTION_DIAL)
            intent.data = Uri.parse("tel:$phoneNumber")
            activity.startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("DIAL_FAILED", "拨号失败: ${e.message}", null)
        }
    }
}