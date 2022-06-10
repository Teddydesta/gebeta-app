import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
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
          left: 10, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.orange,
          ),
          SizedBox(
            height: 20,
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
                  margin: EdgeInsets.only(right: 10),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(child: CustomText(text: "MENU",color: Colors.white,)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.placeholder,
          ),
          SizedBox(height: 15),
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
                        left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 80,
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
                              onTap: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Row(
                                       children: [
                                          CustomText(text: "${1} items  | " ,color: Colors.white,),
                                      CustomText(text: "ETB 231.00",color: Colors.white,),
                                       ],
                                     ),
                                      GestureDetector(
                                         onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const BasketScreen()))),
                                         child: CustomText(text: "View basket",color: Colors.white,))
                                    ],
                                  ))
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add",color: Colors.white,)),
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
                      left: 10,
                      right: 10,
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
                              height: 40,
                              width: 80,
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
                              onTap: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Row(
                                       children: [
                                          CustomText(text: "${1} items  | " ,color: Colors.white,),
                                      CustomText(text: "ETB 231.00",color: Colors.white,),
                                       ],
                                     ),
                                      GestureDetector(
                                         onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const BasketScreen()))),
                                         child: CustomText(text: "View basket",color: Colors.white,))
                                    ],
                                  ))
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add",color: Colors.white,)),
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
                        left: 10, right: 10),
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
                              height: 40,
                              width: 80,
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
                              width: 80,
                            ),
                            GestureDetector(
                              onTap: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Row(
                                       children: [
                                          CustomText(text: "${1} items  | " ,color: Colors.white,),
                                      CustomText(text: "ETB 231.00",color: Colors.white,),
                                       ],
                                     ),
                                      GestureDetector(
                                         onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const BasketScreen()))),
                                         child: CustomText(text: "View basket",color: Colors.white,))
                                    ],
                                  ))
                                );
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(right: 10),
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(
                                      20),
                                ),
                                child: const Center(
                                    child: CustomText(text: "Add",color: Colors.white)),
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
void _menu(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.only(
            top: 200,
            left: 0,
            right: 200,
            bottom: 280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
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
