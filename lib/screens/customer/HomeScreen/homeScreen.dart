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
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    //print("current height::" + MediaQuery.of(context).size.height.toString());

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.orange,
        
        title:  CustomText(
          text: "GEBETA ",
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Divider(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  
                  SearchBar(title: 'Search for restaurants, dishes'),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: CustomText(
                text: 'popular ',
                fontSize: 24,
                color: AppColors.mainBlackColor,
              ),
                  ),
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
