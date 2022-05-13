import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/AbyssiniaCard.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/CbeBirrCard.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/CbeMobileBanking.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/HelloCashCard.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) => const BasketScreen()))),
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: AppColors.orange,
        title: const CustomText(text: "Payments"),
      ),
      drawer: const NavDrawer(),
      body: Container(
        margin: const EdgeInsets.only(top: 20, right: 0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/real/cash on delivery.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "Cash on delivery"),
                  const SizedBox(
                    width: 165,
                  ),
                  const CustomIcon(
                    icon: Icons.circle_outlined,
                    iconSize: 24,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/real/CBE-birr.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "CBE Birr"),
                  const SizedBox(
                    width: 217,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const CbeBirrCard()))),
                    child: const CustomIcon(
                      icon: Icons.circle_outlined,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/images/real/Mobile banking.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "CBE Moble Banking"),
                  const SizedBox(
                    width: 145,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const CbeMobileBankingCard()))),
                    child: const CustomIcon(
                      icon: Icons.circle_outlined,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/real/abysinia.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "Abyssinia "),
                  const SizedBox(
                    width: 205,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const AbyssiniaCard()))),
                    child: const CustomIcon(
                      icon: Icons.circle_outlined,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/real/hello cash.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "Hello Cash"),
                  const SizedBox(
                    width: 200,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const HelloCash()))),
                    child: const CustomIcon(
                      icon: Icons.circle_outlined,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/real/visa.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(text: "Master Card/ Visa"),
                  const SizedBox(
                    width: 155,
                  ),
                  const CustomIcon(
                    icon: Icons.circle_outlined,
                    iconSize: 24,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
