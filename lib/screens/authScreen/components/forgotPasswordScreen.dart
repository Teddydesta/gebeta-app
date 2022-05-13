// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';


class NewPwScreen extends StatelessWidget {
  static const routeName = "/newPw";

  const NewPwScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("New Password", style: Helper.getTheme(context).headline6),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please enter your Phone to recieve a code to create a new password ",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextInput(hintText: "New Password"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextInput(
                  hintText: "Confirm Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBtn(
                  text: "NEXT",
                  color: AppColors.orange,
                  height: 50,
                  width: double.infinity,
                  borderRadius: 8.0,
                  fontSize: 18,
                  textColor: Colors.white,
                  fontWeight: FontWeight.normal,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
