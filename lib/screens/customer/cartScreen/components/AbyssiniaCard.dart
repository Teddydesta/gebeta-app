import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class AbyssiniaCard extends StatelessWidget {
  const AbyssiniaCard({Key? key}) : super(key: key);

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
                  "assets/images/real/abysinia.png",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((BuildContext context) =>
                  //             const PaymentScreen()))),
                  child: const CustomIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: AppColors.orange,
                    iconSize: 25,
                    backgroundColor: Colors.white,
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
            text: " Please follow the following instruction",
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
                      "1. Open Abyssinia Mobile banking application and enter your User ID and Password",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "2. Choose utility Payment from sidebar menu",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "3. Tap WeBirr Payment",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "4. Choose Debit Account and enter payment code",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "5. Tap continue",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "6. Confirm the payment",
                ),
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
