import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/common_widget/common_search_bar.dart';
import 'package:house_example/tab_search/component/body/filter_bar.dart';
import 'package:house_example/tab_search/component/drawer/filter_draw.dart';

import '../../common_widget/common_room_list_widget.dart';
import 'tab_search_logic.dart';
import 'tab_search_state.dart';

class TabSearchWidget extends StatelessWidget {
  TabSearchWidget({super.key});

  final TabSearchLogic _logic = Get.find<TabSearchLogic>();
  final TabSearchState _state = Get
      .find<TabSearchLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonSearchBar(showLocation: true, showMap: true),
      endDrawer: _buildFilterDraw(),
      body: _buildBody(context),
    );
  }



  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildFilterBarWidget(),
        _buildExpanded(context),
      ],
    );
  }

  Widget _buildExpanded(BuildContext context) {
    return GetBuilder<TabSearchLogic>(

      id: TabSearchLogic.roomListId,
      builder: (logic) {


        return Expanded(
          child: RefreshIndicator(
            color: Theme
                .of(context)
                .primaryColor,
            onRefresh: _logic.handlerOnRefresh,
            child: _buildListView(),
          ),
        );
      },
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemExtent: 95.h,
      itemBuilder:
          (BuildContext context, int index) =>
          CommonRoomListWidget(data: _state.roomListItemDatas[index]),
      itemCount: _state.roomListItemDatas.length,
    );
  }

  Widget _buildFilterDraw() => FilterDraw();

  Widget _buildFilterBarWidget() {
    return GetBuilder<TabSearchLogic>(
      id: TabSearchLogic.filterBarId,
      builder: (logic) {
        return FilterBar();
      },
    );
  }
}
