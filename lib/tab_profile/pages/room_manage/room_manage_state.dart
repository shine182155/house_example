import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../tab_search/component/models/RoomListItemData.dart';


class RoomManageState {

  TextStyle tabTextStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w400);
   late List<RoomListItemData> roomListItems;

  RoomManageState() {
    ///Initialize variables
    roomListItems = [
      RoomListItemData(
          title: '朝阳门南大街 2室1厅 8300元',
          subTitle: "二室/114/东|北/朝阳门南大街",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
          price: 1200,
          id: '11',
          tags: ["近地铁", "集中供暖", "新上", "随时看房"],
          backgroundColor: Colors.orange),
      RoomListItemData(
          title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
          subTitle: "一室/110/西/CBD总部公寓二期",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
          price: 6000,
          id: '1',
          tags: ["近地铁", "随时看房"],
          backgroundColor: Colors.blue),
      RoomListItemData(
          title: '朝阳门南大街 2室1厅 8300元',
          subTitle: "二室/114/东|北/朝阳门南大街",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
          price: 1200,
          id: '13',
          tags: ["近地铁", "集中供暖", "新上", "随时看房"],
          backgroundColor: Colors.green),
      RoomListItemData(
          title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
          subTitle: "一室/110/西/CBD总部公寓二期",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
          price: 6000,
          id: '21',
          tags: ["近地铁", "随时看房"],
          backgroundColor: Colors.brown),
      RoomListItemData(
          title: '朝阳门南大街 2室1厅 8300元',
          subTitle: "二室/114/东|北/朝阳门南大街",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
          price: 1200,
          id: '14',
          tags: ["近地铁", "集中供暖", "新上", "随时看房"],
          backgroundColor: Colors.pink),
      RoomListItemData(
          title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
          subTitle: "一室/110/西/CBD总部公寓二期",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
          price: 6000,
          id: '15',
          tags: ["近地铁", "随时看房"],
          backgroundColor: Colors.deepPurpleAccent),
      RoomListItemData(
        title: '朝阳门南大街 2室1厅 8300元',
        subTitle: "二室/114/东|北/朝阳门南大街",
        imageUrl:
        "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
        price: 1200,
        id: '16',
        tags: ["近地铁", "集中供暖", "新上", "随时看房"],
        backgroundColor: Colors.orangeAccent,
      ),
      RoomListItemData(
          title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
          subTitle: "一室/110/西/CBD总部公寓二期",
          imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
          price: 6000,
          id: '1',
          tags: ["近地铁", "随时看房"],
          backgroundColor: Colors.purple),
    ];
  }
}
