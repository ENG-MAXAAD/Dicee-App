import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String runningData;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  const CText(
      {super.key,
      this.size,
      this.fontWeight,
      this.color,
      required this.runningData});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Team One: $runningData',
      style: TextStyle(
          fontSize: size ?? 24,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.white),
    );
  }
}
