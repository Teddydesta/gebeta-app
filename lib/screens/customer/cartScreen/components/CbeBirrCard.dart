import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CbeBirrCard extends StatelessWidget {
  const CbeBirrCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 140, bottom: 140, right: 10, left: 10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: AppColors.orange,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/real/CBE-birr.png",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const PaymentScreen()))),
                  child: const CustomIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    iconSize: 25,
                    backgroundColor: AppColors.orange,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomText(
            text: "Please follow the following instruction",
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "1. Dial *847#"),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "2. choose 3 (Pay Bill)"),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "3. choose 5 (WeBirr)"),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "4. Enter the payment code"),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "5. Enter 1 to confirm the payment"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          CustomBtn(
            text: "NEXT",
            color: AppColors.orange,
            borderRadius: 8.0,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
            onPressed: () {},
            height: 50,
            width: 200,
          ),
        ],
      ),
    );
  }
}
