import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_logic.dart';
import 'loading_state.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  final LoadingLogic _logic = Get.find<LoadingLogic>();

  final LoadingState _state = Get
      .find<LoadingLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return _buildStack();
  }

  Widget _buildStack() {
    return GetBuilder<LoadingLogic>(
      assignId: true,
      builder: (logic) {
        return Stack(
          children: _buildChildren(),
        );
      },
    );
  }

  List<Widget> _buildChildren() {
    return [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('static/images/loading.jpg'),
          ),
        ),
      ),
      Positioned(
        top: 40,
        right: 20,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black26,
          ),
          child: Center(
            child: Text(
              '${_state.remainingTime}',
              style: const TextStyle(
                fontSize: 15,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
