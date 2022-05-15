import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class AccountWidget extends StatelessWidget {
  CustomIcon appIcon;
  CustomText customText;
  AccountWidget({Key? key, required this.appIcon, required this.customText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Row(
        children: [
          appIcon,
          const SizedBox(
            width: 20,
          ),
          customText,
        ],
      ),
    );
  }
}
