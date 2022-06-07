import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized(); 
    await Firebase.initializeApp();
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gebeta App',
      home: SignInPage(),
    );
  }
}
