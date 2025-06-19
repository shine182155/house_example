import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tab_home/compoment/body/item_widget.dart';
import '../models/InfoItem.dart';
EdgeInsetsGeometry _padding = const EdgeInsets.only( left: 5, right: 5);
class CommonInfo extends StatelessWidget {
  final List<InfoItem> data;
  final bool showTitle;

  const CommonInfo({super.key, required this.data, required this.showTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:_padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildContent(),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      _buildTitleText(),
      SizedBox(height: 5),
      _buildListViewContent(),
    ];
  }

  ListView _buildListViewContent() =>
      ListView.builder(
        itemExtent: 100.h,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ItemWidget(data: data[index]);
        },
      );


  Widget _buildTitleText() =>
      showTitle == true ? Text('最新咨询', style: TextStyle(fontWeight: FontWeight.w600)):SizedBox();
}
