import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/DeliveredProducts.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/categoryScreen/categoryScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/nearbyScreen/nearby.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchBar.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

import '../../../models/UserModel.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HotelModel> hotels = [];
  bool loading = false;
  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void initState() {
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
            backgroundColor: Colors.white,
            drawer: NavDrawer(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              actions: [
                CustomIcon(
                  icon: Icons.favorite_outlined,
                  iconSize: 24,
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                )
              ],
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, left: 25, bottom: 15),
                          width: 190,
                          child: Text(
                            'Take Your Healthy Foods ',
                            maxLines: 2,
                            style: TextStyle(
                                wordSpacing: 8.0,
                                fontFamily: 'WorkSansBold',
                                color: Colors.black87,
                                fontSize: 34,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Populars ',
                            maxLines: 2,
                            style: TextStyle(
                                wordSpacing: 8.0,
                                fontFamily: 'lobster',
                                color: Colors.black87,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
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
