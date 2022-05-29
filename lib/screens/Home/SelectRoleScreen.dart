import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 0, bottom: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  height: 100,
                  child: const Center(
                    child: CustomText(
                      text: "How Do You Want to Continue ?",
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
            colors: [AppColors.orange, Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
                     // color: AppColors.orange,
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const HomeMainScreen()))),
                  child: CustomBtn(
                    text: "CUSTOMER",
                    color:Colors.orangeAccent,
                    height: 200,
                    width: 400,
                    borderRadius: 5.0,
                    fontSize: 30,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const HomeMainScreen())));
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const RestaurantHomeScreen()))),
                  child: CustomBtn(
                    text: "RESTAURANT",
                    color: Colors.grey,
                    height: 200,
                    width: 400,
                    borderRadius: 5.0,
                    fontSize: 30,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const RestaurantHomeScreen())));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
