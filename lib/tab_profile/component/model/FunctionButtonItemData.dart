import 'package:flutter/material.dart';

class FunctionButtonItemData {
  final String imageUrl;
  final String title;
  final Function? onTapHandle;
  FunctionButtonItemData(this.imageUrl, this.title, this.onTapHandle);
}

final List<FunctionButtonItemData> list = [
  FunctionButtonItemData('static/images/home_profile_record.png', "看房记录", null),
  FunctionButtonItemData('static/images/home_profile_order.png', '我的订单', null),
  FunctionButtonItemData('static/images/home_profile_favor.png', '我的收藏', null),
  FunctionButtonItemData('static/images/home_profile_id.png', '身份认证', null),
  FunctionButtonItemData('static/images/home_profile_message.png', '联系我们', null),
  FunctionButtonItemData('static/images/home_profile_contract.png', '电子合同', null),
  FunctionButtonItemData('static/images/home_profile_wallet.png', '钱包', null),
  FunctionButtonItemData('static/images/home_profile_house.png', "房屋管理", (context) {
    bool isLogin = true; //假设先设置未登录
    if (isLogin) {
      Navigator.pushNamed(context, 'roomManage');
    }
  })
];
