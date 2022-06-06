import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var toggle = true;
  changeToggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (toggle) {
      return SignInPage(
        changeToggle: changeToggle,
      );
    } else {
      return Register(
        changeToggle: changeToggle,
      );
    }
  }
}
