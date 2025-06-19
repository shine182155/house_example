package com.example.house_example
import com.umeng.commonsdk.UMConfigure
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.house_example"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 预初始化（必须调用）
//        UMConfigure.setLogEnabled(true);
//        UMConfigure.preInit(this, "68340e64bc47b67d83727fae", "HUAWEI")

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "set_umeng_privacy" -> UmengPrivacyHandler.handle(call, result, this)
                "otherMethod" -> OtherHandler.handle(call, result, this)
                "dial_phone_number" -> DialPhoneNumberHandler.handle(call, result, this)
                else -> result.notImplemented()
            }
        }
    }

    // 新增：友盟和微信初始化方法

}