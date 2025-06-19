import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../tab_search/component/models/RoomListItemData.dart';
import '../tab_search/tab_search_logic.dart';
import 'common_tag.dart';



 EdgeInsetsGeometry _padding = EdgeInsets.only(left: 5, right: 5,bottom: 5);
class CommonRoomListWidget extends StatelessWidget {
  final RoomListItemData data;

 CommonRoomListWidget({super.key, required this.data});

   final TabSearchLogic  _logic = Get.find<TabSearchLogic>();
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:_logic.navigatorToRoomDetail,
      child: Container(
        height: 95.h,
        padding: _padding,
        child: Row(
          children: [
            _buildCacheImage(data.imageUrl),
            SizedBox(width: 7),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    data.subTitle,
                  ),
                  Row(
                    children: data.tags
                        .map((item) =>
                              CommonTag(tag: item, color: data.backgroundColor))
                        .toList(),
                  ),
                  Text(
                    '${data.price}元/月',
                    style: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

 Widget  _buildCacheImage(String imageUrl) {
    return Card(shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.r),
    ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: CachedNetworkImage(imageUrl: imageUrl,
        width: 130.w,
        height: 95.h,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),

      ),
    );

  }
}
