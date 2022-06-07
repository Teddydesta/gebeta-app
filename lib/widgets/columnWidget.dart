import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/commonIconWidget.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class ColumnWidget extends StatelessWidget {
  final String text;
  const ColumnWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.orange,
                );
              }),
            ),
            SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "4.6",
              fontSize: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "99",
              fontSize: 12,
            ),
            SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "comments",
              fontSize: 12,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CommonIcon(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            CommonIcon(
              icon: Icons.location_on,
              iconColor: AppColors.orange,
              text: '12.4km',
            ),
            CommonIcon(
              icon: Icons.access_time_filled_rounded,
              text: "2:30 am",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
