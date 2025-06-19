import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonPicker {
  /// iOS 风格的选择器
  static Future<int?> showCupertinoPicker(
      {required BuildContext context,
      required List<String> options,
      required int initialIndex}) async {
    final selectedIndex = await showCupertinoModalPopup<int>(
        context: context,
        builder: (context) {
          int selectedIndex = initialIndex;

          return StatefulBuilder(builder: (context, setState) {
            return Container(
              height: 300,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[200],
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              '取消',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, selectedIndex);
                            },
                            child: Text(
                              '确定',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: CupertinoPicker(
                          itemExtent: 30,
                          backgroundColor: Colors.white,
                          onSelectedItemChanged: (val) {
                            setState(() {
                              selectedIndex = val;
                            });
                          },
                          children: options.map((item) => Text(item)).toList()))
                ],
              ),
            );
          });
        });

    return selectedIndex;
  }

  /// Material 风格的选择器
  static Future<int?> showMaterialPicker({
    required BuildContext context,
    required List<String> options,
    required int initialIndex,
  }) async {
    final selectedIndex = await showModalBottomSheet<int?>(
      context: context,
      isScrollControlled: true,
      // 允许弹窗高度自适应
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        int selectedIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(top: 16),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  // 顶部标题和操作按钮
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('取消',
                              style: TextStyle(color: Colors.grey)),
                        ),
                        const Text('选择项目',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(context, selectedIndex),
                          child: const Text('确定',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // 可滚动的选项列表
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(options[index]),
                          trailing: selectedIndex == index
                              ? const Icon(Icons.check, color: Colors.blue)
                              : null,
                          onTap: () => setState(() => selectedIndex = index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    return selectedIndex;
  }
}
