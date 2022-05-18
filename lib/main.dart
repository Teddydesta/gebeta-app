import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gebeta App',
      home: HomeMainScreen(),
    );
  }
}
