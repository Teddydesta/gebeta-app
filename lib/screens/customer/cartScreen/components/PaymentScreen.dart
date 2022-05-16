import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
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
                    onTap: () => _cbeBirr(context),
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
                    onTap: () => _cbeMobileBanking(context),
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
                    onTap: () => _abyssinia(context),
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
                    onTap: () => _helloCash(context),
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

void _helloCash(context) {
  showDialog(
    context: context,
    builder: (context) {
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
    },
  );
}

void _abyssinia(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin:
            const EdgeInsets.only(top: 140, bottom: 140, right: 10, left: 10),
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
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const PaymentScreen()))),
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
    },
  );
}

void _cbeMobileBanking(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin:
            const EdgeInsets.only(top: 140, bottom: 140, right: 10, left: 10),
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
    },
  );
}

void _cbeBirr(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin:
            const EdgeInsets.only(top: 140, bottom: 140, right: 10, left: 10),
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
                  CustomText(text: "1. Dial *847#"),
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
    },
  );
}
