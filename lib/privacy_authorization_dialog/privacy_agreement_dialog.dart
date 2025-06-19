// 提取隐私对话框为独立组件
import 'package:flutter/material.dart';

class PrivacyAgreementDialog extends StatelessWidget {
  final VoidCallback onAgreed;
  final VoidCallback onDisagreed;

  const PrivacyAgreementDialog({
    required this.onAgreed,
    required this.onDisagreed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('隐私政策', style: TextStyle(fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('请仔细阅读并同意我们的隐私政策以继续使用应用。'),
            SizedBox(height: 16),
            Text('数据收集声明：', style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              '我们的产品集成友盟+SDK，需要收集设备标识信息（如IMEI、Mac地址等）'
                  '用于统计分析、数据校准和反作弊功能。详细信息请查阅完整隐私政策。',
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => _launchPrivacyPolicy(context),
              child: Text(
                '查看完整隐私政策',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('不同意', style: TextStyle(color: Colors.grey)),
          onPressed: onDisagreed,
        ),
        ElevatedButton(
          child: Text('同意'),
          onPressed: onAgreed,
        ),
      ],
    );
  }

  void _launchPrivacyPolicy(BuildContext context) {
    // 实际项目中打开网页链接
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('打开隐私政策页面')),
    );
  }
}