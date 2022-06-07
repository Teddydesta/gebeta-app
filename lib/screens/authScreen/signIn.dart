// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/animation/scaleRoute.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/signInBtn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signUp.dart';
import 'package:gebeta_food_delivery/screens/customer/HomeScreen/homeScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/otpScreen/OtpScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';

class SignInPage extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  final changeToggle;
  const SignInPage({Key? key, this.changeToggle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showPassword = true;

  String? _phone;
  TextEditingController _phoneController = TextEditingController();
  String? _password;
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final _formKey = GlobalKey<FormState>();
  var userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _validatePassword(String value) {
      if (value.length < 4)
        return 'password must be greater than 4';
      else
        return null;
    }

    _validatePhone(String value) {
      if (value.length < 10 || value.length > 13)
        return 'Phone must greater than 9 and less than 13';
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(value)) return 'Please enter valid mobile number';

      return null;
    }

    _showSnackBar(context, text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(new SnackBar(content: CustomText(text: text)));
    }

    onSubmitForm(context) async {
      setState(() {
        loading = true;
      });
      var res = await userServices.loginUser_Phone(
          phone: _phoneController.text.toString(),
          password: _passwordController.text.toString());
      setState(() {
        loading = false;
      });
      if (res['error'] == null) {
        _showSnackBar(context, 'Successfully logged in');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomeMainScreen()),
            ModalRoute.withName('/'));
        return;
      }
      _showSnackBar(context, res['error']);
      return;
    }

    @override
    void dispose() {
      _phoneController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>  HomeMainScreen()))),
            child: Container(
              height: 30,
              width: 100,
              margin: EdgeInsets.only(right: 10, top: 2, bottom: 7),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.orange, Color(0xFFfbab66)],
                    begin: FractionalOffset(0.2, 0.2),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),

                borderRadius: BorderRadius.circular(10.0),
                // color: Colors.white,
              ),
              child: Center(
                  child: CustomText(
                      text: "GUEST",
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            )
          : Padding(
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
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: "940502345",
                                // hide max character counter
                                counter: Offstage(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(8.0)),

                                prefixIcon: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 80,
                                  child: Row(
                                    children: [
                                      CustomIcon(
                                        icon: Icons.phone,
                                        iconColor: AppColors.orange,
                                        backgroundColor: Colors.white10,
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
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: showPassword,

                              keyboardType: TextInputType.text,
                              //maxLine: 1,
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: "password",
                                // hide max character counter
                                counter: Offstage(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
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
                                    color: AppColors.orange,
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
                            const SizedBox(height: 5,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    ScaleRoute(page: const SendOtpScreen()));
                              },
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                padding: EdgeInsets.only(left: 200),
                                child: Text(
                                  "forgot password",
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            SignInButtonWidget(
                              onPressed: () => onSubmitForm(context),
                              loading: loading,
                              text: 'Sign in',
                            ),
                           
                            
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
                              "I Don't  have account? ",
                              style: TextStyle(
                                color: const Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    ScaleRoute(page: const SignUpPage()));
                              },
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Text(
                                  "Sign Up",
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

