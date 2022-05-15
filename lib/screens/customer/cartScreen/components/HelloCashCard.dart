import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class HelloCash extends StatelessWidget {
  const HelloCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 550, left: 0, right: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const PaymentScreen()))),
            child: Container(
              margin: const EdgeInsets.only(left: 380),
              child: const CustomIcon(
                icon: Icons.arrow_back_ios,
                backgroundColor: Colors.white,
                iconColor: AppColors.orange,
                iconSize: 24,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(text: "Hello Cash"),
          const SizedBox(
            height: 25,
          ),
          const CustomText(text: "Please enter your phone number"),
          const SizedBox(
            height: 25,
          ),
          Wrap(
            children: List.generate(10, (index) {
              return const Icon(
                Icons.remove,
                size: 24,
                color: AppColors.orange,
              );
            }),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            child: const Center(
              child: CustomText(text: "PAY"),
            ),
            height: 40,
            width: 300,
            decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
