import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

var buttonStyle = ButtonStyle(
  overlayColor: WidgetStatePropertyAll(Colors.transparent),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
);

class OpenAppSettingWithCallPhone extends StatelessWidget {
  const OpenAppSettingWithCallPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '权限申请',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '拨打电话需要获取拨打电话权限，请前往设置中心开启',

                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Divider(height: 0.5, color: Colors.black12),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: buttonStyle,
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Container(width: 1,height: 40,color: Colors.black12),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      openAppSettings();
                    },
                    style: buttonStyle,
                    child: Text(
                      '去设置',
                      style: TextStyle(
                        color: Color(0xFF0E32FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
