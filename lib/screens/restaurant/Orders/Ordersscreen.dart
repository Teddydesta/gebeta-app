import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/profileScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 35, left: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const RestaurantProfileScreen()))),
                  child: const CustomIcon(
                    icon: Icons.arrow_back_ios,
                    iconSize: 24,
                    iconColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 80),
                const CustomText(
                  text: "List Of Orders",
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          GestureDetector(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const OrdersScreen())))),
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Order Id: 2"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      CustomText(text: "Date"),
                      const SizedBox(
                        width: 140,
                      ),
                      CustomText(text: "Sat, 14 may, 2021"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      CustomText(text: "Client"),
                      SizedBox(
                        width: 140,
                      ),
                      CustomText(text: "Tewodros desta"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      CustomText(text: "Delivery Address"),
                      SizedBox(
                        width: 63,
                      ),
                      CustomText(text: " 6Q9X+HH Welkite, Ethiopia "),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
