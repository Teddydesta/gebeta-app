import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/Address/add_address.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/otpScreen/OtpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gebeta App',
      home: SendOTPScreen(),
    );
  }
}
