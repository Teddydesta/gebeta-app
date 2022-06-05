// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class NewPasswordScreen extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool showPassword=true;
 
  String? _password;
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     _validatePassword(String value){
       if(value.length <4)
         return 'password must be greater than 4';
         else
          return null;
     }

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
                               ProfileScreen()))),
                                child: CustomIcon(icon: Icons.close,iconColor: AppColors.orange,iconSize: 24,backgroundColor: Colors.white10,)),
                              SizedBox(width: 15,),
                              CustomText(text: "New Password",fontSize: 24,),
                            ],
                          ),
                          
                            SizedBox(height: 1.5,),
    
    
                          TextFormField(
                              
                          
                            keyboardType: TextInputType.text,
                            //maxLine: 1,
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "current password",
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
                            suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        }),
                           
                          ),
                          
                            ),
                            SizedBox(height: 15,),
                             TextFormField(
                              obscureText: showPassword,
                       
                            keyboardType: TextInputType.text,
                            //maxLine: 1,
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "New password",
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
                            
                             
                            suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        }),
                            //labelText: "Pasword",
                          ),
                            ), 
                           
                            SizedBox(height: 15,),
                             TextFormField(
                              obscureText: showPassword,
                       
                            keyboardType: TextInputType.text,
                            //maxLine: 1,
                            readOnly: false,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
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
                            
                             
                            suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        }),
                            //labelText: "Pasword",
                          ),
                            ), 
                            SizedBox(height: 25,),
                            Container(
                              height: 45,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(left: 25,right: 25),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25),
                               gradient: LinearGradient(
            colors: [AppColors.orange, Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
                             ),
                              child: Center(child: CustomText(text: "NEXT",color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold,),),
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
