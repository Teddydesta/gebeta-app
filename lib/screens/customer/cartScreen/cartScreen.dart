import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomIcon(
                      icon: Icons.arrow_back,
                      iconColor: AppColors.orange,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                    CustomIcon(
                      icon: Icons.home,
                      iconColor: AppColors.orange,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                    CustomIcon(
                      icon: Icons.shopping_cart,
                      iconColor: AppColors.orange,
                      iconSize: 24,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              bottom: 0,
              child: Container(
                  child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 120,
                        width: double.maxFinite,
                        //color: AppColors.orange,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/real/western.png"),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: 'Delicius piza',
                                    color: Colors.black,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(
                                        text: "150.00 Birr",
                                        color: AppColors.orange,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 0,
                                            left: 10,
                                            right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.white),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.remove,
                                              color: AppColors.orange,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              text: '0',
                                              color: AppColors.orange,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: AppColors.orange,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    }),
              )))
        ],
      ),
    );
  }
}
