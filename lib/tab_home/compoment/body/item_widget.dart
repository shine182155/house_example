import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../models/InfoItem.dart';
import '../../tab_home_logic.dart';

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  ItemWidget({super.key, required this.data});

  final TabHomeLogic _logic = Get.find<TabHomeLogic>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _logic.navigateToImageDetailPage(data),
      child: Container(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Row(children: _buildContent()),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: CachedNetworkImage(
          width: 120.w,
          height: 100.h,
          imageUrl: data.imageUrl,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
       Padding(padding: EdgeInsets.only(left: 10.w)),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(data.source), Text(data.time)],
            ),
          ],
        ),
      ),
    ];
  }
}
