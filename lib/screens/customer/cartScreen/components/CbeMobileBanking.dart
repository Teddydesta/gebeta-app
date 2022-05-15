import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CbeMobileBankingCard extends StatelessWidget {
  const CbeMobileBankingCard({Key? key}) : super(key: key);

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
                  "assets/images/real/Mobile banking.png",
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
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                    text:
                        "1. Open CBE Mobile banking application and enter your PIN"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "2. Tap Utility"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "3.  Tap Utility Payment"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "4.  Tap WeBirr"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "5. Enter Payment code"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "6. Enter your reason for payment"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "7. Confirm the payment"),
                SizedBox(
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
