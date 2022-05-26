// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gebeta_food_delivery/screens/animation/scaleRoute.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/signUpBtn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/formFilld.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword=true;
  String? _phone;
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
_validatePhone(String value){
  if(value.length<10 || value.length>13)
     return 'phone number must greater than 10';
     else
        String pattern=r'(^(?:[+0]9)?[0-9]{10,12}$)';
        //RegExp regExp =new RegExp(Pattern);
       // if(!regExp.hasMatch(value)) return 'please enter valis phone number';
        return null;

}
_showSnackBar(context,text){
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: CustomText(text: text)));
}

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;


//Form(
        //key: _formKey,
      //  child: SingleChildScrollView(
        //  padding: EdgeInsets.all(10.0),
        //  child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
           // children: [
           //   Container(
             //   width: 100,
               // height: 100,
               // decoration: BoxDecoration(
                //  shape: BoxShape.circle,
               // ),
                //child: Image(image: AssetImage("assetName")),
             // ),
          //  ],
         // ),
       // ),),

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
         key: _formKey,
          
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 15,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 200,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/gebeta_logo.png",
                          ),
                        ),
                        
                        
                          SizedBox(height: 15,),
                        TextFormField(
                            
                         // hintText: "Name",
                         //isPassword: false,
                          keyboardType: TextInputType.text,
                          //maxLine: 1,
                          readOnly: false,
                          decoration: InputDecoration(
                            hintText: "940502345",
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
                          prefixIcon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 80,
                                    child: Row(
                                      children: [
                                        CustomIcon(
                                          icon: Icons.phone,
                                          iconColor: AppColors.orange,
                                          backgroundColor: Colors.white,
                                         iconSize: 22,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '+251',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
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
                            hintText: "password",
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
                          
                           prefixIcon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 80,
                                    child: Row(
                                      children: [
                                        CustomIcon(
                                          icon: Icons.key,
                                          iconColor: AppColors.orange,
                                          backgroundColor: Colors.white10,
                                          
                                         iconSize: 22,
                                        ),
                                      
                                        
                                      ],
                                    ),
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
                          SizedBox(height: 15),
                          SignUpButtonWidget(),
                          FacebookGoogleLogin(),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: const Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context, ScaleRoute(page: const SignInPage()));
                          },
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
      
    );
  }
}

class FacebookGoogleLogin extends StatelessWidget {
  const FacebookGoogleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black12,
                        Colors.black54,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                width: 100.0,
                height: 1.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  "Or",
                  style: TextStyle(
                      color: Color(0xFF2c2b2b),
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium"),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black12,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                width: 100.0,
                height: 1.0,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 40.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orange,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.facebookF,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orange,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.google,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
