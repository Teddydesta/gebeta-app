import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class OTPInput extends StatelessWidget {
  OTPInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColors.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 20),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
