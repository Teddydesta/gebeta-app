import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.orange,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Recommended",
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(
            text: "Special Donuts",
            fontWeight: FontWeight.bold,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/food0.png"))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                  text: "2 Specialty Donuts",
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "Contains donuts of your choosing ",
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "ETB120.00 ",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          const CustomText(
            text: "PIZZA",
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              decoration: const BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/food0.png"))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                  text: "Ramas Special",
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "Contains donuts of your favorite  ",
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "ETB200.00 ",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          const CustomText(
            text: "SALAD",
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/food0.png"))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                  text: "Ceasar Salad",
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "pure and mix salad",
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "ETB110.00 ",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}