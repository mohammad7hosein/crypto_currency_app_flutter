import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final Color color;
  final double margin;

  const MyDivider({
    required this.color,
    required this.margin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: double.infinity,
      height: 1,
      color: color,
    );
  }
}
