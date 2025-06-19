import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tab_home/tab_home_view.dart';
import '../tab_info/tab_info_view.dart';
import '../tab_profile/tab_profile_view.dart';
import '../tab_search/tab_search_view.dart';
import 'home_logic.dart';
import 'home_state.dart';

List<StatelessWidget> _listWidget = [
  TabHomeWidget(),
  TabSearchWidget(),
  TabInfoWidget(),
  TabProfileWidget(),
];

const List<BottomNavigationBarItem> _barItemList = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
  BottomNavigationBarItem(icon: Icon(Icons.info), label: '资讯'),
  BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的'),
];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final HomeLogic _logic = Get.find<HomeLogic>();

  final HomeState _state = Get.find<HomeLogic>().state;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UmengCommonSdk.initCommon('68340e64bc47b67d83727fae', '68355b44bc47b67d83738075', 'debug'); // 测试阶段
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          _logic.handlerOnPopInvokedWithResult(didPop, result),
      child: GetBuilder<HomeLogic>(
        builder: (logic) {
          return Scaffold(

            body: _buildBody(),
            bottomNavigationBar: _buildBottomNavigationBar(context, logic),
          );
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context, HomeLogic logic) {
    return BottomNavigationBar(
            items: _barItemList,
            type: BottomNavigationBarType.fixed,
            currentIndex: _state.currentIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (index) {
              logic.handlerOnTap(index);


            },
          );
  }

  StatelessWidget _buildBody() => _listWidget[_state.currentIndex];

}
