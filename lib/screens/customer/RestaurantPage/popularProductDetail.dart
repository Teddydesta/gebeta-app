import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/columnWidget.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

import '../../../widgets/descriptiontext.dart';

class PopularProductDetails extends StatelessWidget {
  const PopularProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food0.png"))),
              )),
          //left and right icons
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const HomeMainScreen()))),
                  child: const CustomIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    iconSize: 12,
                    backgroundColor: AppColors.orange,
                  ),
                ),
                const CustomIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconSize: 21,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.orange,
                ),
              ],
            ),
          ),
          //
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              //

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ColumnWidget(text: "Sheger food"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(text: "Description"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: DescriptionText(
                        text:
                            "Lorem ipsum dolor sit amet. Ut repellendus Quis sed quaerat vero ea mollitia galisum a omnis distinctio ea iusto praesentium ut fugit qui modi facere. Ut voluptas alias ad neque rerum et illum quia et perferendis sunt aut reiciendis facilis. Ut expedita ipsa ab repellat necessitatibus et dignissimos aliquid sed harum temporibus",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(00.0), topRight: Radius.circular(40.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.orange),
              child: Row(
                children: const [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(text: '0'),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.orange,
              ),
              child: const CustomText(
                text: 'Add to cart | 120 birr',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
