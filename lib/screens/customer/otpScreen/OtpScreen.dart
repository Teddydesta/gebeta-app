
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';
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
            Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: AppColors.orange,
          ),
        ],
        gradient: LinearGradient(
            colors: [AppColors.orange, Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: AppColors.orange,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "NEXT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: "WorkSansBold"),
            ),
          ),
          onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const SignInPage()))),
              }),
    ),
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
