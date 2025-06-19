import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonFormItem extends StatelessWidget {
  final String label;
  final String? hitText;
  final Icon? suffixIcon;
  final String? suffixString;
  final Widget Function(BuildContext context)? contentBuilder;

  const CommonFormItem(
      {super.key,
      required this.label,
      this.hitText,
      this.suffixIcon,
      this.suffixString,
      this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 0.7))),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Container(
              width: 100.w,
              child: Text(
                label,
                style: const TextStyle(fontSize: 15),
              )),
          Expanded(
              child: contentBuilder != null
                  ? contentBuilder!(context)
                  : TextField(
                      decoration: InputDecoration(
                        hintText: hitText,
                        hintStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                      ),
                    )),
          if (suffixIcon != null) suffixIcon!,
          if (suffixIcon == null && suffixString != null) Text(suffixString!)
        ],
      ),
    );
  }
}
