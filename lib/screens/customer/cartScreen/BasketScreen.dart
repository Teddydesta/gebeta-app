import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                  top: Dimensions.height40,
                  left: Dimensions.width15,
                  right: Dimensions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Dimensions.height40,
                        width: Dimensions.width100,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/gebeta-logo.png")),
                        ),
                      ),
                      const CustomText(
                        text: "Babis Bistro",
                        fontSize: 24,
                      ),
                      SizedBox(
                        width: Dimensions.width450,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const HomeMainScreen()))),
                          child: const CustomIcon(
                            icon: Icons.arrow_back_ios,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            Row(
              children: const [
                CustomIcon(
                    icon: Icons.circle_outlined,
                    backgroundColor: Colors.white,
                    iconSize: 20,
                    iconColor: AppColors.placeholder),
                SizedBox(
                  width: 25,
                ),
                CustomText(text: "Sweety Pizza"),
                SizedBox(
                  width: 45,
                ),
                CustomIcon(
                  icon: Icons.remove,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(text: "0"),
                SizedBox(
                  width: 10,
                ),
                CustomIcon(
                  icon: Icons.add,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                CustomText(text: "ETB120")
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey[350],
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Bill Detail",
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "Item Total"),
                        CustomText(text: "ETB240.00")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "Distance Range"),
                        CustomText(text: "28 KM")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "delivery Charges"),
                        CustomText(text: "ETB25")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: " Total Discount"),
                        CustomText(text: "ETB0.00")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "To  Pay"),
                        CustomText(text: "ETB240.00")
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey[350],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(
                    text: "Order Type",
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      CustomIcon(
                        icon: Icons.circle_outlined,
                        iconSize: 20,
                        iconColor: AppColors.placeholder,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(text: "Delivery"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) =>
                          const PaymentScreen()))),
              child: CustomBtn(
                text: "PROCEED TO PAY",
                color: AppColors.orange,
                height: 50,
                width: 400,
                borderRadius: 8.0,
                fontSize: 18,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const PaymentScreen())));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
