// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gebeta_food_delivery/screens/animation/scaleRoute.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/signInBtn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/signUpBtn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/socialMediaButton.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signUp.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/formFilld.dart';

class ProfileSettingScreen extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  bool showPassword=true;
 

  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     
     
_showSnackBar(context,text){
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: CustomText(text: text)));
}

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;



    return Material(
      child: Container(

          margin: const EdgeInsets.only(top: 30, right: 0),
           padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
           key: _formKey,
            
              
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 15,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const ProfileScreen()))),
                                child: CustomIcon(icon: Icons.close,iconColor: AppColors.orange,iconSize: 24,backgroundColor: Colors.white10,)),
                              SizedBox(width: 15,),
                              CustomText(text: "Edit Profile",fontSize: 24,),
                               SizedBox(width: 120,),
                              TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const ProfileScreen())));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                       gradient: LinearGradient(
            colors: [AppColors.orange, Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.orange,
                ),
                child: Center(
                  child: const CustomText(
                      text: 'SAVE', color: Colors.white, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              ),)
                            ],
                          ),
                          
                            SizedBox(height: 1.5,),
    
    
                          TextFormField(
                              
                          
                            keyboardType: TextInputType.text,
                            //maxLine: 1,
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "Name",
                              // hide max character counter
                                      counter: Offstage(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8.0)
                            ),
                          
                           
                          ),
                          
                            ),
                            SizedBox(height: 15,),
                             TextFormField(
                              obscureText: showPassword,
                       
                            keyboardType: TextInputType.text,
                            //maxLine: 1,
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "Phone",
                              // hide max character counter
                                      counter: Offstage(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8.0),
                            ),
                            
                             
                           
                           // labelText: "Pasword",
                          ),
                            ), 
                           
                            
                           
                           
                            
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
        ),
    );
      
    
  }
}
