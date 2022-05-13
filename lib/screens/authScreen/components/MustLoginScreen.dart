import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';



class MustLoginScreen extends StatelessWidget {
  const MustLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: 500.0,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 0, bottom: 10),
              decoration: BoxDecoration(
                  //color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/login.png"))),
            ),
            const SizedBox(
              height: 25,
            ),
            //Login Button
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) => const SignInPage()))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(
                    child: CustomText(
                  text: "Login",
                  fontSize: 24,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
