import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gebeta_food_delivery/screens/authScreen/authScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gebeta_food_delivery/services/common.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isAuthenticated = false;
  bool loading = false;
  String role = '';
  getToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      loading = true;
    });

    if (prefs.containsKey('token')) {
      setState(() {
        isAuthenticated = true;
      });
    } else {
      setState(() {
        isAuthenticated = false;
      });
    }
    await Future.delayed(
      Duration(milliseconds: 2000),
    );
    setState(() {
      loading = false;
    });
  }

  getRole() async {
    final SharedPreferences prefs = await _prefs;
    String? rrole = await prefs.getString('role');
    setState(() {
      role = rrole!;
      loading = true;
    });
  }

  @override
  void initState() {
    getToken();
    getRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (loading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            ),
          )
        : isAuthenticated
            ? role == 'hotelOwner'
                ? RestaurantHomeScreen()
                : HomeMainScreen()
            : AuthScreen());
  }
}
