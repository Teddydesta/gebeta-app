import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RestaurantScreenDetails extends StatefulWidget {
  const RestaurantScreenDetails({Key? key}) : super(key: key);

  @override
  _RestaurantScreenDetailsState createState() =>
      _RestaurantScreenDetailsState();
}

class _RestaurantScreenDetailsState extends State<RestaurantScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      margin: EdgeInsets.only(
          left: Dimensions.width10, bottom: Dimensions.height30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.height15,
          ),
          const Divider(
            color: AppColors.orange,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Recommended",
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: () => _menu(context),
                child: Container(
                  margin: EdgeInsets.only(right: Dimensions.width10),
                  height: Dimensions.height40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: const Center(child: CustomText(text: "MENU")),
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          SizedBox(height: Dimensions.height15),
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
                    margin: EdgeInsets.only(
                        left: Dimensions.width10, right: Dimensions.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Dimensions.height40,
                              width: Dimensions.width80,
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
                    margin: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                    ),
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
                              height: Dimensions.height40,
                              width: Dimensions.width80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
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
                    margin: EdgeInsets.only(
                        left: Dimensions.width10, right: Dimensions.width10),
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
                              height: Dimensions.height40,
                              width: Dimensions.width80,
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
                            SizedBox(
                              width: Dimensions.width100,
                            ),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                margin:
                                    EdgeInsets.only(right: Dimensions.width10),
                                height: Dimensions.height30,
                                width: Dimensions.width80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
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

///
///
///
///
void _menu(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.only(
            top: Dimensions.height200,
            left: 0,
            right: Dimensions.width200,
            bottom: Dimensions.height280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(Dimensions.radius10),
            topRight: Radius.circular(Dimensions.radius10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "Recommended"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "doner"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "gril dish"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "oven/firin"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "pizza"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "desert"),
            ),
          ],
        ),
      );
    },
  );
}
