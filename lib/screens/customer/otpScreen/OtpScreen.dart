// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/new_passwordscreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/text_form_field.dart';

class SendOTPScreen extends StatelessWidget {
  static const routeName = "/sendOTP";

  const SendOTPScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'We have sent you an OTP to your Mobile',
              style: Helper.getTheme(context).headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Please check your mobile number 091*****12 continue to reset your password",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextFormFieldWidget(
                  hintText: "0",
                  keyboardType: TextInputType.number,
                ),
                TextFormFieldWidget(
                  
                  hintText: "0",
                  keyboardType: TextInputType.number,
                ),
                TextFormFieldWidget(
                  hintText: "0",
                  keyboardType: TextInputType.number,
                ),
                TextFormFieldWidget(
                  hintText: "0",
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomBtn(
                text: "Next",
                color: AppColors.orange,
                height: 50,
                width: 450,
                borderRadius: 8.0,
                fontSize: 30,
                textColor: Colors.white,
                fontWeight: FontWeight.normal,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const NewPwScreen())));
                }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomText(text: "Didn't Recieve? "),
                CustomText(
                  text: "Click Here",
                  color: AppColors.orange,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
