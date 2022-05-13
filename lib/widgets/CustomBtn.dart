// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final Color? textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback? onPressed;

  const CustomBtn({
    required this.text,
    this.color = const Color(0x00f07945),
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 8.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: CustomText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
