import 'package:flutter/material.dart';

import 'Index_recommendItem.dart';
import 'index_recommend_item_widget.dart';


class IndexReCommend extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexReCommend({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(color: Color(0x08000000)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('房屋推荐', style: TextStyle(fontWeight: FontWeight.w600)),
              Text(
                '更多',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: dataList
                .map((item) => IndexRecommendItemWidget(data: item))
                .toList(),
          )
        ],
      ),
    );
  }
}
