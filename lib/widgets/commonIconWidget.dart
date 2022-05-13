// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CommonIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color iconColor;
  const CommonIcon(
      {Key? key,
      required this.icon,
      required this.text,
      this.color,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(
          width: 5,
        ),
        CustomText(
          text: text,
          color: AppColors.mainBlackColor,
          fontSize: 12,
        ),
      ],
    );
  }
}
