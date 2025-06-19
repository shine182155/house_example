import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/room_release/room_release_logic.dart';
import 'package:house_example/utils/common_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../tab_profile/pages/room_release/room_release_state.dart';

// 常量定义
const _itemSpacing = 10.0;
const _gridPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const _maxItemCount = 9; // 根据需求调整最大图片数量

class CommonImagePicker extends StatelessWidget {
  CommonImagePicker({super.key});

  final RoomReleaseLogic _logic = Get.find<RoomReleaseLogic>();
  final RoomReleaseState _state = Get.find<RoomReleaseLogic>().state;

  @override
  Widget build(BuildContext context) {
    final itemWidth =
        (MediaQuery.of(context).size.width - _itemSpacing * 4) / 3;
    final itemHeight = itemWidth / (750 / 424);

    return Container(
      padding: _gridPadding,
      child: Wrap(
        spacing: _itemSpacing,
        runSpacing: _itemSpacing,
        children: [
          // 先添加按钮
          _buildAddButton(itemWidth, itemHeight),
          // 再显示图片
          ..._buildImageItems(itemWidth, itemHeight),
        ],
      ),
    );
  }

  Widget _buildAddButton(double width, double height) {
    return Visibility(
      visible: _state.files.length < _maxItemCount,
      child: _AddButton(
        width: width,
        height: height,
        onPressed: _logic.pickImage,
      ),
    );
  }

  List<Widget> _buildImageItems(double width, double height) {
    return _state.files
        .map(
          (file) => _ImageItem(
            file: file,
            width: width,
            height: height,
            key: ValueKey(file.path),
            onDelete: () => _logic.removeImage(file),
          ),
        )
        .toList();
  }
}

class _ImageItem extends StatelessWidget {
  final XFile file;
  final double width;
  final double height;
  final VoidCallback onDelete;

  const _ImageItem({
    required this.file,
    required this.width,
    required this.height,
    required this.onDelete,
    required ValueKey<String> key,
  });


  @override
  Widget build(BuildContext context) {
  final RoomReleaseLogic _logic = Get.find<RoomReleaseLogic>();
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: () =>_logic.buildImageDialog(file.path),child: Image.file(File(file.path), fit: BoxFit.cover)),
          Positioned(
            top: 2,
            right: 2,
            child: _DeleteButton(onPressed: onDelete),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;

  const _AddButton({
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _DeleteButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.9),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(4),
          child: const Icon(Icons.close, size: 16, color: Colors.red),
        ),
      ),
    );
  }
}
