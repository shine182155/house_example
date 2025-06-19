import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'image_detail_logic.dart';
import 'image_detail_state.dart';

class ImageDetailPage extends StatelessWidget {
  ImageDetailPage({super.key});

  final ImageDetailLogic _logic = Get.find<ImageDetailLogic>();
  final ImageDetailState _state = Get.find<ImageDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _buildBody());
  }

  GestureDetector _buildBody() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _logic.onBack,
      child: _buildColumn(),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 200),
            child: CachedNetworkImage(imageUrl: _state.infoItem.imageUrl,
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (_, _, _) => Icon(Icons.error),),
          ),
        Container(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            _state.infoItem.title,
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _state.infoItem.source,
                style: TextStyle(color: Colors.white),
              ),
              Text(_state.infoItem.time, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
