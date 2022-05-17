import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RowCustomWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final String? text;
  const RowCustomWidget(
      {Key? key, required this.icon, this.text, this.color, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          icon: icon,
          iconColor: AppColors.orange,
        ),
        Column(
          children: const [
            CustomText(
              text: "TUNA SANDWICH",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text:
                  "Tuna meat mixed with our chipotle, mayonnaise filled with egg and luttce",
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "ETB250",
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const CustomText(text: "Add"),
        ),
      ],
    );
  }
}
