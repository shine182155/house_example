import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widget/common_floating_action_button.dart';
import '../../../common_widget/common_image_picker.dart';
import '../../../common_widget/common_radio_form_item.dart';
import '../../../common_widget/common_select_form_item.dart';
import '../../../common_widget/common_title.dart';
import '../../../common_widget/common_form_item.dart';
import 'enum/room_property_type.dart';
import 'room_release_logic.dart';
import 'room_release_state.dart';

class RoomReleasePage extends StatelessWidget {
  RoomReleasePage({super.key});

  final RoomReleaseLogic _logic = Get.find<RoomReleaseLogic>();
  final RoomReleaseState _state = Get
      .find<RoomReleaseLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('房源发布')),
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton(
        title: '提交',
        onTop: _logic.releaseRoom,
      ),
    );
  }

  Container _buildBody() {
    return Container(
      padding:  EdgeInsets.only(top: 5.h),
      child: SingleChildScrollView(child: _buildColumn()),
    );
  }

  Column _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:  EdgeInsets.only(top: 10.h, bottom: 15.h),
          child: const CommonTitle(title: '房源信息'),
        ),
        CommonFormItem(
          label: '小区',
          contentBuilder: (context) {
            return const Text('请选择小区');
          },
          suffixIcon: const Icon(Icons.keyboard_arrow_right),
        ),
        const CommonFormItem(
          label: '租金',
          hitText: '请输入租金',
          suffixString: '元/月',
        ),
        const CommonFormItem(
            label: '大小', hitText: '房屋大小', suffixString: '平方米'),

        _buildRentRadio(),

        _buildRoomTypeSelect(),
        _buildFloorTypeSelect(),
        _buildOrientedTypeSelect(),

        _buildDecorationRadio(),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const CommonTitle(title: '房源头像'),
        ),
        _buildImagePicker(),
        Container(
          padding: const EdgeInsetsDirectional.only(top: 10),
          child: const CommonTitle(title: '房源标题'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入标题:(整租,小区名为二室两千元)',
            ),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: const CommonTitle(title: '房源配置'),),
        // const RoomConfigure(),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const CommonTitle(title: '房屋描述'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 100),
          child: const TextField(
            maxLines: 6,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入房屋描述信息',
            ),
          ),
        ),
      ],
    );
  }

 Widget _buildOrientedTypeSelect() {
    return GetBuilder<RoomReleaseLogic>(id: RoomReleaseLogic.orientedTypeSelectId,builder: (logic) {
      return CommonSelectFormItem(
        label: '朝向',
        options: const ['东', '南', '西', '北'],
        value: _state.orientedType,
        type: RoomPropertyType.orientedType,
      );
    });
  }

  Widget _buildFloorTypeSelect() {
    return GetBuilder<RoomReleaseLogic>(
        id: RoomReleaseLogic.floorTypeSelectId, builder: (logic) {
      return CommonSelectFormItem(
        label: '楼层',
        options: const ['高楼层', '中楼层', '低楼层'],
        value: _state.floorType,
        type: RoomPropertyType.floorType,
      );
    });
  }

  Widget _buildRoomTypeSelect() {
    return GetBuilder<RoomReleaseLogic>(
        id: RoomReleaseLogic.roomTypeSelectId, builder: (logic) {
      return CommonSelectFormItem(
        label: '户型',
        options: const ['一室', '二室', '三室', '四室'],
        value: _state.roomType,
        type: RoomPropertyType.roomType,
      );
    });
  }

  Widget _buildDecorationRadio() {
    return GetBuilder<RoomReleaseLogic>(
      id: RoomReleaseLogic.decorationRadioId,
      builder: (logic) {
        return CommonRadioFormItem(
          label: '装修',
          options: const ['精装', '简装'],
          initValue: _state.decorationType,
          type: RoomPropertyType.decorationType,
        );
      },
    );
  }

  Widget _buildRentRadio() {
    return GetBuilder<RoomReleaseLogic>(
      id: RoomReleaseLogic.rentRadioId,
      builder: (logic) {
        return CommonRadioFormItem(
          label: '租聘方式',
          options: const ['合租', '整租'],
          initValue: _state.rentType,
          type: RoomPropertyType.rentType,
        );
      },
    );
  }

  Widget _buildImagePicker() {
    return GetBuilder<RoomReleaseLogic>(
      id: RoomReleaseLogic.imagePickerId,
      builder: (logic) {
        return CommonImagePicker();
      },
    );
  }
}
