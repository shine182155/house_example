import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/common_widget/common_info.dart';
import 'package:house_example/common_widget/common_search_bar.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';
import 'package:house_example/tab_home/tab_home_state.dart';

import 'tab_info_logic.dart';
import 'tab_info_state.dart';

class TabInfoWidget extends StatelessWidget {
  TabInfoWidget({super.key});

  final TabInfoLogic _logic = Get.find<TabInfoLogic>();
  final TabInfoState _state = Get.find<TabInfoLogic>().state;

  final TabHomeLogic _tabHomeLogic = Get.find<TabHomeLogic>();
  final TabHomeState _tabHomeState = Get.find<TabHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonSearchBar(showLocation: false, showMap: false),
      body: GetBuilder<TabHomeLogic>(
        assignId: true,
        builder: (logic) {
          return _buildBody(context);
        },
      ),
    );
  }

  RefreshIndicator _buildBody(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: _logic.handlerOnRefresh,
      child: _buildContent(),
    );
  }

  Widget _buildContent() =>
      SingleChildScrollView(child: CommonInfo(data: _tabHomeState.infoItems, showTitle: false));
}
