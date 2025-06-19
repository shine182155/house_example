// 搜索页数据准备
import 'package:flutter/material.dart';

class RoomListItemData {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<String> tags;
  final int price;
  final Color backgroundColor;

  const RoomListItemData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      required this.tags,
      required this.price,
      this.backgroundColor = Colors.purple});
}


