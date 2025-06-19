import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/common_widget/common_disable_input_search_bar.dart';
import 'package:house_example/common_widget/common_info.dart';
import 'package:house_example/common_widget/common_swiper.dart';

import 'compoment/body/index_navigator.dart';
import 'compoment/body/index_recommend.dart';
import 'tab_home_logic.dart';
import 'tab_home_state.dart';

class TabHomeWidget extends StatelessWidget {
  TabHomeWidget({super.key});

  final TabHomeLogic _logic = Get.find<TabHomeLogic>();
  final TabHomeState state = Get.find<TabHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonDisableInputSearchBar(),
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(child: _buildColumn());
  }

  /// 构建列表
  Column _buildColumn() {
    return Column(
      children: [
        _buildCommonSwiper(),
        _buildIndexNavigator(),
        _buildIndexReCommend(),
        _buildCommonInfo()
      ],
    );
  }

  Widget _buildCommonInfo() =>
      CommonInfo(data: state.infoItems, showTitle: true);

  Widget _buildIndexReCommend() => IndexReCommend(dataList: state.list);

  Widget _buildCommonSwiper() => CommonSwiper(list: state.carouselImages);

  Widget _buildIndexNavigator() => IndexNavigator();
}
