import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.fontSize = 18,
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: txtColor,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
