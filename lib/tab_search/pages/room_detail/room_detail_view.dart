import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';
import 'package:house_example/tab_home/tab_home_state.dart';

import '../../../common_widget/common_info.dart';
import '../../../common_widget/common_swiper.dart';
import '../../../common_widget/common_tag.dart';
import '../../../common_widget/common_title.dart';
import '../../../utils/common_utils.dart';
import 'base_info_item.dart';
import 'room_detail_logic.dart';
import 'room_detail_state.dart';

TextStyle bottomButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14);

class RoomDetailPage extends StatelessWidget {
  RoomDetailPage({super.key});

  final RoomDetailLogic _logic = Get.find<RoomDetailLogic>();
  final RoomDetailState _state = Get
      .find<RoomDetailLogic>()
      .state;
  final TabHomeLogic _tabHomeLogic = Get.find<TabHomeLogic>();
  final TabHomeState _tabHomeState = Get
      .find<TabHomeLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _builderBody());
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(_state.data.title!),
      actions: [
        IconButton(
          onPressed: () {
            // Share.share('https://www.baidu.com');
          },
          icon: const Icon(Icons.share, color: Colors.white),
        ),
      ],
      backgroundColor: Theme
          .of(context)
          .primaryColor,
    );
  }

  Widget _builderBody() {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 500), () => '我是假数据'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Icon(Icons.error));
        }
        if (snapshot.hasData) {
          return _builderFutureContent(context);
        }

        return Center(
          child: CircularProgressIndicator(
            color: Theme
                .of(context)
                .primaryColor,
          ),
        );
      },
    );
  }

  Column _builderFutureContent(BuildContext context) {
    return Column(
      children: [_buildExpanded(context), _buildBottomButton(context)],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return GetBuilder<RoomDetailLogic>(
      id: RoomDetailLogic.bottomButtonId,
      builder: (logic) {
        return Container(
          color: Color(0xEEEEEEFF),
          width: double.infinity,
          height: 90.h,
          child: Container(
            padding:  EdgeInsets.only(
              left: 20.w,
              top: 20.h,
              right: 20.w,
              bottom: 20.h,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 75.w,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: _logic.updateCollectStatus,
                    child: Column(
                      children: [
                        _state.isCollected
                            ? Icon(Icons.star, color: Colors.green)
                            : Icon(Icons.star_border, color: Colors.grey),

                        Text(_state.isCollected ? '已经收藏' : '未收藏'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            backgroundColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed:
                              () => _logic.launchPhoneCall('18215518049'),
                          child: Text('拨打电话', style: bottomButtonTextStyle),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            backgroundColor: Colors.blue,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed: () => showToast(content: '功能未实现'),
                          child: Text('在线咨询', style: bottomButtonTextStyle),
                        ),
                      ),
                      // SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        );
      },
    );

    return SizedBox(height: 90, width: double.infinity, child: Stack());
  }

  Expanded _buildExpanded(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Theme
            .of(context)
            .primaryColor,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1)); // 模拟网络请求
          showToast(content: '数据加载完成');
        },
        child: SingleChildScrollView(child: _buildColumn()),
      ),
    );
  }

  // SingleChildScrollView _buildSingleChildScrollView() {
  //   return SingleChildScrollView(child: _buildColumn());
  // }

  Column _buildColumn() {
    return Column(
      children: [
        CommonSwiper(list: _tabHomeState.carouselImages),
        CommonTitle(title: _state.data.title!),
        Container(
          padding:  EdgeInsets.only(left: 10.w, top: 10.h),
          child: Row(
            children: [
              Text(
                '${_state.data.price}/元',
                style:  TextStyle(color: Colors.red, fontSize: 20.sp),
              ),
               Text(
                '(押一付三)',
                style: TextStyle(color: Colors.red, fontSize: 15.sp),
              ),
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.only(left: 10.w, top: 10.h),
          child: Row(
            children:
            _state.data.tags!
                .map((item) => CommonTag(tag: item, color: Colors.green))
                .toList(),
          ),
        ),
        Container(
          padding:  EdgeInsets.only(left: 10.w, top: 10.h),
          child: Divider(),
        ),
        Container(
          padding:  EdgeInsets.only(left: 10.w, top: 10.h),
          child: Wrap(
            runSpacing: 10.h,
            children: [
              BaseInfoItem(data: '面积:${_state.data.size}'),
              BaseInfoItem(data: '楼层:${_state.data.floor}'),
              BaseInfoItem(data: '户型:${_state.data.roomType}'),
              const BaseInfoItem(data: '装修:精装'),
            ],
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: const CommonTitle(title: '房屋配置'),
        // ),
        // Container(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: RoomApplianceList(list: _state.data.applicances!),
        // ),
        const CommonTitle(title: '房屋状况'),
        _buildRoomDetails(),
        CommonInfo(data: _state.infoItems, showTitle: false),
      ],
    );
  }

  Widget _buildRoomDetails() {
    return GetBuilder<RoomDetailLogic>(id: RoomDetailLogic.roomDetailsId,builder: (logic) {
      return Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: [
            Text(
              _state.data.subTitle!,
              maxLines: _state.showAllText ? null : 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _logic.updateShowAllTextStatus,
                  child: Row(
                    children: [
                      Text(_state.showAllText ? '收起' : '展开'),
                      Icon(
                        _state.showAllText
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),
                ),
                Text('举报'),
              ],
            ),
          ],
        ),
      );
    });
  }
}
