import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTop;

  const CommonFloatingActionButton(
      {super.key, required this.title, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTop,
      child: Container(height: 40,margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
