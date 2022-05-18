// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/RestaurantPage/Components/RestaurantMenuScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchBar.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RestaurantMainScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  const RestaurantMainScreen({Key? key}) : super(key: key);

  @override
  _RestaurantMainScreenState createState() => _RestaurantMainScreenState();
}

class _RestaurantMainScreenState extends State<RestaurantMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((BuildContext context) => const HomeMainScreen()))),
          child: const CustomIcon(
            icon: Icons.arrow_back_ios,
            iconColor: Colors.white,
            iconSize: 24,
            backgroundColor: AppColors.orange,
          ),
        ),
        title: CustomText(text: "BABIS BISTRO"),
        centerTitle: true,
        backgroundColor: AppColors.orange,
        elevation: 0,
        actions: [
          PopupMenuButton(
              color: Colors.white,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  // _value = value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Default"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            iconSize: 24,
                            backgroundColor: Colors.white,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Name: A - Z"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            iconSize: 24,
                            backgroundColor: Colors.white,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Name: Z - A"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Price: Low to High"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Price: High to Low"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                  ])
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimensions.height180,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/restaurant_cover.png"))),
                  ),
                  SearchBar(title: 'Search for restaurants, dishes'),
                  SizedBox(height: Dimensions.height15),
                  RestaurantScreenDetails(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
