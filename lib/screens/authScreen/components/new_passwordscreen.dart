// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signUp.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/formFilld.dart';

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

            padding:  EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const ProfileScreen()))),
                      child: const CustomIcon(
                        icon: Icons.close,
                        iconColor: AppColors.orange,
                        iconSize: 24,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const CustomBtn(
                      text: "Save",
                      textColor: Colors.white,
                      fontSize: 24,
                      height: 35,
                      width: 80,
                      borderRadius: 5,
                      color: AppColors.orange,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "New Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                const FormFieldWidget(
                  hintText: "Current Password",
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  maxLine: 1,
                  readOnly: false,
                  labelText: "Pasword",
                ),
                const SizedBox(
                  height: 30,
                ),
                const FormFieldWidget(
                  hintText: "New Password",
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  maxLine: 1,
                  readOnly: false,
                  labelText: "Pasword",
                ),
                const SizedBox(
                  height: 20,
                ),
                const FormFieldWidget(
                  hintText: "Confirm Password",
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  maxLine: 1,
                  readOnly: false,
                  labelText: "Pasword",
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const SignInPage()))),
                  child: Container(
                    child: Center(child: CustomText(text: "NEXT",fontWeight: FontWeight.bold,fontSize: 24,)),
                  //  color: AppColors.orange,
                    height: 50,
                    width: double.infinity,
                    
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                            colors: [AppColors.orange, Color(0xFFfbab66)],
                            begin: FractionalOffset(0.2, 0.2),
                            end: FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                  ),
                    
                   
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
