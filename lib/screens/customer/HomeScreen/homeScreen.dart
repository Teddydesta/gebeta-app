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
   _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
      duration: Duration(seconds: 3),
    ));
  }
@override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // Timer(Duration(seconds: 5), ()=> Navigator.of(context).pushReplacement(
   //   MaterialPageRoute(builder: (BuildContext context) => HomeMainScreen()),),
   // );

    
    //print("current height::" + MediaQuery.of(context).size.height.toString());

    return loading
    ? Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            ),
          )
    
    : Scaffold(
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
            SearchBar(title: 'Search for restaurants, dishes'),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  
                  
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
