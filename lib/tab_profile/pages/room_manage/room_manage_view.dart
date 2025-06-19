import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/common_floating_action_button.dart';
import '../../../common_widget/common_room_list_widget.dart';
import '../../../utils/common_utils.dart';
import 'room_manage_logic.dart';
import 'room_manage_state.dart';

class RoomManagePage extends StatelessWidget {
  RoomManagePage({super.key});

  final RoomManageLogic _logic = Get.find<RoomManageLogic>();
  final RoomManageState _state = Get.find<RoomManageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton(
          title: '发布房源',
          onTop: _logic.navigateToRoomRelease,
        ),
        body: _buildBody(context),
      ),
    );
  }

  TabBarView _buildBody(BuildContext context) {
    return TabBarView(
      children: [
        buildRefreshIndicator(context),
        buildRefreshIndicator(context),
      ],
    );
  }

  RefreshIndicator buildRefreshIndicator(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1)); // 模拟网络请求
        showToast(content: '数据加载完成');
      },
      child: ListView(
        children:
            _state.roomListItems
                .map((item) => CommonRoomListWidget(data: item))
                .toList(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,       // 选中状态文字颜色
        unselectedLabelColor: Colors.grey, // 未选中状态文字颜色
        tabs: [
          const Tab(child: Text('出租')),
          Tab(child: Text('已租', style: _state.tabTextStyle)),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('房屋管理', style: TextStyle(color: Colors.white)),
    );
  }
}
