// ignore_for_file: prefer_const_constructors, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: unused_field
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                Helper.getAssetName("splashIcon.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Helper.getAssetName("gebeta_logo.png", "real"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
