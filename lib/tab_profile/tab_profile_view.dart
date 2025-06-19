import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';
import 'package:house_example/tab_profile/component/body/header.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_logic.dart';

import '../common_widget/common_info.dart';
import '../common_widget/common_title.dart';
import '../tab_home/tab_home_state.dart';
import '../utils/common_utils.dart';
import 'component/body/advertisement.dart';
import 'component/model/function_button.dart';
import 'tab_profile_logic.dart';
import 'tab_profile_state.dart';

class TabProfileWidget extends StatelessWidget {
  TabProfileWidget({Key? key}) : super(key: key);

  final TabProfileLogic _logic = Get.find<TabProfileLogic>();
  final TabProfileState _state = Get
      .find<TabProfileLogic>()
      .state;

  final TabHomeLogic _homeLogic = Get.find<TabHomeLogic>();
  final TabHomeState _homeState = Get
      .find<TabHomeLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
  }

  AppBar _buildAppBar(BuildContext context) =>
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Text('我的', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        actions: [
          IconButton(
            onPressed: _logic.navigateToUserSetting,
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      );

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: _handlerRefresh,
      child: SingleChildScrollView(child: _buildColumn()),
    );
  }

  /// 构建列表
  Column _buildColumn() {
    return Column(
      children: [
        _buildHeader(),
        _buildFunctionButton(),
        _buildAdvertisement(),
        _buildCommonTitle(),
        _buildCommonInfo(),
      ],
    );
  }

  Widget _buildCommonTitle() => const CommonTitle(title: '最新资讯');

  Widget _buildFunctionButton() => FunctionButton(list: _state.dataList);

  Widget _buildAdvertisement() => Advertisement();

  Widget _buildCommonInfo() =>
      CommonInfo(data: _homeState.infoItems, showTitle: false);

  Future<void> _handlerRefresh() async {
    await Future.delayed(Duration(seconds: 1)); // 模拟网络请求
    showToast(content: '数据加载完成');
  }

  Widget _buildHeader() {
    return GetBuilder<UserLoginLogic>(
    id:UserLoginLogic.headerId
    ,builder: (logic) {
      return Header();
    });
  }
}
