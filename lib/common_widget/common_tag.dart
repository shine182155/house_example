import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String tag;
  final Color color;

  const CommonTag({super.key, required this.tag, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2),
        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 2),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(4.0))),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white,fontSize:13 ),
        ));
  }
}
