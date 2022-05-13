// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/categoryScreen/categoryScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/nearbyScreen/nearby.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchBar.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const CustomText(
          text: "Gebeta Delivery",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: const [
                  SearchBar(title: 'Search for restaurants, dishes'),
                  SizedBox(
                    height: 5,
                  ),
                  CategoryScreen(),
                  NearByScreen(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
