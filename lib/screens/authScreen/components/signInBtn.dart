// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/Home/SelectRoleScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class SignInButtonWidget extends StatelessWidget {
  final loading;
  final text;
  final onPressed;
  const SignInButtonWidget({Key? key, this.onPressed, this.loading, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFFfbab66),
            ),
            BoxShadow(
              color: AppColors.orange,
            ),
          ],
         
        ),
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: AppColors.blackColor,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "SIGN IN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "WorkSansBold"),
              ),
            ),
            onPressed: onPressed));
  }
}
