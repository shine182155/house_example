import 'package:flutter/material.dart';

import '../../models/general_type.dart';
import 'component/models/RoomListItemData.dart';

class TabSearchState {
  late List<GeneralType> areaList;
  late List<GeneralType> priceList;
  late List<GeneralType> rentTypeList;

  late List<GeneralType> roomTypeList;
  late List<GeneralType> orientedList;
  late List<GeneralType> floorList;

  late  List<RoomListItemData> roomListItemDatas ;
  late List<GeneralType> areaLists;
  late List<GeneralType> priceLists;
  late List<GeneralType> rentTypeLists;
  late List<GeneralType> roomTypeLists;
  late List<GeneralType> orientedLists;
  late List<GeneralType> floorLists;

  var isAreaSelected = false;
  var isRentTypeSelected = false;
  var isPriceSelected = false;
  var isFilterSelected = false;

  var areaId = '';
  var rentTypeId = '';
  var priceId = '';

  String searchWord = '';
  late  TextEditingController controller ;


  TabSearchState() {
    ///Initialize variables
     areaList = [
      GeneralType('区域1', '11'),
      GeneralType('区域2', '22'),
    ];
    priceList = [
      GeneralType('价格1', 'bb'),
      GeneralType('价格2', 'aa'),
    ];
    rentTypeList = [
      GeneralType('出租类型1', 'bb'),
      GeneralType('出租类型2', '22'),
    ];
     roomTypeList = [
      GeneralType('房屋类型1', '11'),
      GeneralType('房屋类型2', '22'),
    ];
     orientedList = [
      GeneralType('方向1', '99'),
      GeneralType('方向2', 'cc'),
    ];
     floorList = [
      GeneralType('楼层1', 'aa'),
      GeneralType('楼层2', 'bb'),
    ];


     roomListItemDatas = [
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/edb1ce-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/a828bef3b3ef1eec0995453c45525811-800x650.jpg",
           price: 1200,
           id: '11',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.orange),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/6d21aa-%E8%AF%9A%E5%BE%B7%E5%A5%BD%E6%88%BF/26bbe94e9d74d77a21f68912ca6d9369-800x650.jpg",
           price: 6000,
           id: '1',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.blue),
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/cce8c7-%E4%BF%A1%E5%88%99/8dec63e0e8a7ec56a73cb3e50769d111-800x650.jpg",
           price: 1200,
           id: '13',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.green),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic3.ajkimg.com/ajk/acfef235036c2e1844a562e9252c4097/800x600.jpg",
           price: 6000,
           id: '21',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.brown),
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic1.ajkimg.com/display/ajk/cf902fa15b6f99a2175acb4b2f29728b/640x420c.jpg",
           price: 1200,
           id: '14',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.pink),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/1efc95-%E4%BF%A1%E5%88%99/d45fd27f941c42521006286453b61400-800x650.jpg",
           price: 6000,
           id: '15',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.deepPurpleAccent),
       RoomListItemData(
         title: '朝阳门南大街 2室1厅 8300元',
         subTitle: "二室/114/东|北/朝阳门南大街",
         imageUrl:
         "https://pic1.ajkimg.com/display/anjuke/290665534678813308bc58ca3b398458/600x450c.jpg",
         price: 1200,
         id: '16',
         tags: ["近地铁", "集中供暖", "新上", "随时看房"],
         backgroundColor: Colors.orangeAccent,
       ),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/ee3b9ef48398196180081d94f2776890/600x450c.jpg",
           price: 6000,
           id: '1',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.purple),
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/d82e0a8677b63bf8e54765885042b153/600x450c.jpg",
           price: 1200,
           id: '11',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.orange),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/ccc6d190b650593958dffb2c8d0e1da6/600x450c.jpg",
           price: 6000,
           id: '1',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.blue),
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/0a515a89d1d0623ea679c84bb576e7bb/600x450c.jpg",
           price: 1200,
           id: '13',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.green),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/3e708d-%E8%BE%B0%E9%82%A6%E4%BC%97%E5%90%88/30add14ea380f3950094d3d5ff54a94b-800x650.jpg",
           price: 6000,
           id: '21',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.brown),
       RoomListItemData(
           title: '朝阳门南大街 2室1厅 8300元',
           subTitle: "二室/114/东|北/朝阳门南大街",
           imageUrl:
           "https://pic4.ajkimg.com/display/58ajk/f3d5a1b33a6bbd05eef6586cb6d78f91/600x500c.jpg",
           price: 1200,
           id: '14',
           tags: ["近地铁", "集中供暖", "新上", "随时看房"],
           backgroundColor: Colors.pink),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/98d7c2-%E5%90%8D%E5%B0%9A%E8%AA%89/869c0629a380080301d483575f039f27-800x650.jpg?frame=1",
           price: 6000,
           id: '15',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.deepPurpleAccent),
       RoomListItemData(
         title: '朝阳门南大街 2室1厅 8300元',
         subTitle: "二室/114/东|北/朝阳门南大街",
         imageUrl:
         "https://pic1.ajkimg.com/display/anjuke/f90273-%E8%BE%B0%E9%82%A6%E4%BC%97%E5%90%88/7c7b5b31004df4525d05a2263e9edb23-800x650.jpg",
         price: 1200,
         id: '16',
         tags: ["近地铁", "集中供暖", "新上", "随时看房"],
         backgroundColor: Colors.orangeAccent,
       ),
       RoomListItemData(
           title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
           subTitle: "一室/110/西/CBD总部公寓二期",
           imageUrl:
           "https://pic1.ajkimg.com/display/anjuke/c6e00a-%E5%90%8D%E5%B0%9A%E8%AA%89/2042861884ecc0ac56e345aacd4ba5e2-800x650.jpg",
           price: 6000,
           id: '1',
           tags: ["近地铁", "随时看房"],
           backgroundColor: Colors.purple),
     ];

     areaList = [
       GeneralType('区域1', '11'),
       GeneralType('区域2', '22'),
     ];
     priceList = [
       GeneralType('价格1', 'bb'),
       GeneralType('价格2', 'aa'),
     ];
     rentTypeList = [
       GeneralType('出租类型1', 'bb'),
       GeneralType('出租类型2', '22'),
     ];
     roomTypeList = [
       GeneralType('房屋类型1', '11'),
       GeneralType('房屋类型2', '22'),
     ];
     orientedList = [
       GeneralType('方向1', '99'),
       GeneralType('方向2', 'cc'),
     ];
     floorList = [
       GeneralType('楼层1', 'aa'),
       GeneralType('楼层2', 'bb'),
     ];

     controller = TextEditingController();
  }
}
