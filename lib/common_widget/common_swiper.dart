import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';
import 'package:house_example/tab_home/tab_home_state.dart';

// 图片宽 750px 高 424px
// 设置图片的宽高(为了代码易于阅读)
var imageHeight = 750.0;
var imageWidth = 424.0;

class CommonSwiper extends StatelessWidget {
  final List<String> list;

  CommonSwiper({super.key, required this.list});

  final TabHomeState _state = Get.find<TabHomeLogic>().state;

  @override
  Widget build(BuildContext context) {

    // var width = MediaQuery.of(context).size.width;
    // // 计算得到图片宽高比
    // var aspectRatio = 16/ 9;
    // //根据图片的宽高比 和 固定屏幕的宽度 计算高度Swiper的高度，避免影响图片效果.
    // var height = MediaQuery.of(context).size.width * aspectRatio;

    return SizedBox(
      height: 200.h,
      child: Swiper(
        itemCount: _state.carouselImages.length,
        autoplay: true,
        pagination: SwiperPagination(),
        itemBuilder:
            (_, index) => CachedNetworkImage(
              imageUrl: _state.carouselImages[index],
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
      ),
    );
  }
}
