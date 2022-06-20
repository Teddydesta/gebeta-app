// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/animation/scaleRoute.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/customerHotelOwnerToggle.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  final changeToggle;
  final phone;
  const SignUpPage({Key? key, this.changeToggle, this.phone}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  LocationUtils _locationUtils = LocationUtils();
  Map _location = {};
  bool _isCustomer = true;
  bool showPassword = false;
  String verificationIda = '';
  bool isOtp = false;
  bool isSigningUp = false;
  bool I = false;
  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _email;
  TextEditingController _emailController = TextEditingController();

  String? _phone;
  TextEditingController _phoneController = TextEditingController();
  String? _password;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool loading = false;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final _formKey = GlobalKey<FormState>();
  var userServices = UserServices();

  _roleIsCustomer() {
    _isCustomer = true;
    print(_isCustomer);
  }

  _roleIsHotel() {
    _isCustomer = false;
    print(_isCustomer);
  }

  _validateName(String value) {
    value.trim();
    if (value.isEmpty) return 'Please enter your name';
    if (double.tryParse(value) != null) return 'Only text are allowed';

    return null;
  }

  _validatePassword(String value) {
    if (value.length < 6)
      return 'Password must be greater than 6';
    else
      return null;
  }

  _validateEmail(String value) {
    value.trim();
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else
      return null;
  }

  _validatePhone(String value) {
    if (value.length < 10 || value.length > 13)
      return 'Phone must greater than 9 and less than 13';

    return null;
  }

  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text(text, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange));
  }

  onSubmitForm(context) async {
    if (_location.isEmpty) {
      await getLocation();
      _showSnackBar(
        context,
        'Location coordinates are required',
      );
    }
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      var res;
      if (_isCustomer) {
        res = await userServices.registerUser(
            name: _name,
            email: _email,
            phone: '+251${_phoneController.text.trim()}',
            // location: _location,
            password: _password);
      } else {
        res = await userServices.registerHotel(
            name: _name,
            email: _email,
            phone: '+251${_phoneController.text.trim()}',
            // location: _location,
            password: _password);
      }
      print(res);
      if (res['error'] == null) {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomeMainScreen()),
            ModalRoute.withName('/'));
        _showSnackBar(
            context,
            _isCustomer
                ? 'Customer successfully registered'
                : 'Resturant successfully registered');
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        loading = false;
      });
      _showSnackBar(context, res['error']);
      return;
    }
  }

  getLocation() async {
    print('Fetching location ... ');
    var result = await _locationUtils.getCurrentPosition();
    print('result : $result');
    if (result['result'] == null) {
      _showSnackBar(context, "Error fetching location, ${result['error']}");
      // Create alert dialog to ask location permission from the user
      return;
    }
    print('result : $result');

    _location.addAll({
      'lat': result['result']['lat'].toString(),
      'lng': result['result']['lng'].toString()
    });
    print('location : $_location');
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  handleVerifyOtp() async {
    String phone = '+251${_phoneController.text.trim()}';
    if (_otpController.text == '') {
      _showSnackBar(context, "Please enter otp");
      return;
    }
    print(phone);
    setState(() {
      loading = true; // setstate
      isSigningUp = true; 
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIda, smsCode: _otpController.text);

    _otpController.text = credential.smsCode!;
    UserCredential result = await auth.signInWithCredential(credential);
    User? user = result.user;
    if (user != null) {
      var res = await userServices.registerUser(
          name: _name,
          email: _email,
          phone: '+251${_phoneController.text.trim()}',
          // location: _location,
          password: _password);

      if (res['error'] == null) {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomeMainScreen()),
            ModalRoute.withName('/'));
        _showSnackBar(
            context,
            _isCustomer
                ? 'Customer successfully registered'
                : 'Resturant successfully registered');
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        loading = false;
      });
      _showSnackBar(context, res['error']);
    } else {
      _showSnackBar(context, 'server error, please try again');
      print('error');
    }
  }

  handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      print(_emailController.text.trim());
      print(_nameController.text.trim());
      print(_phoneController.text.trim());
      print(_passwordController.text.trim());
      isSigningUp = true;
      var res = await userServices.checkIfPhoneIsInUse(
          phone: '${_phoneController.text.trim()}');
      if (res != null) {
        isSigningUp = false;
        _showSnackBar(context, 'user exist with this phone number');
        return;
      } else {
        await auth.verifyPhoneNumber(
          phoneNumber: '+251${_phoneController.text.trim()}',
          codeSent: (String verificationId, int? resendToken) async {
            setState(() {
              loading = true; // setstate
            });
            verificationIda = verificationId;
            setState(() {
              isOtp = true;
            });
            setState(() {
              loading = false; // setstate
            });
            isSigningUp = false;

            // // Update the UI - wait for the user to enter the SMS code
            // String smsCode = _otpController.text;

            // // Create a PhoneAuthCredential with the code
            // PhoneAuthCredential credential = PhoneAuthProvider.credential(
            //     verificationId: verificationId, smsCode: smsCode);

            // // Sign the user in (or link) with the credential
            // await auth.signInWithCredential(credential);
          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            setState(() {
              loading = false; // setstate
              isSigningUp = false; // setstate
            }); // Auto-resolution timed out...
          },
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            String phone = '+251${_phoneController.text.trim()}';
            setState(() {
              loading = true;
              isSigningUp = true; // setstate
            });
            print(phoneAuthCredential.smsCode);
            setState(() {
              _otpController.text = phoneAuthCredential.smsCode!;
            });
            UserCredential result =
                await auth.signInWithCredential(phoneAuthCredential);
            User? user = result.user;
            print(user);
            if (user != null) {
              ///if (_isCustomer) {
              var registerRes = await userServices.registerUser(
                  name: _name,
                  email: _email,
                  phone: '+251${_phoneController.text.trim()}',
                  // location: _location,
                  password: _password);

              if (registerRes['error'] == null) {
                _showSnackBar(context, 'Successfully registtered');
                isSigningUp = false; // setstate

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeMainScreen()),
                    ModalRoute.withName('/'));
                return;
              }
              isSigningUp = false; // setstate

              // save token and redirect
              print(registerRes);
            } else {
              setState(() {
                loading = false;
                isSigningUp = false; // setstate
                // setstate
              });
              print('error');
            }
            setState(() {
              isSigningUp = false; // setstate

              loading = false; // setstate
            });
          },
          verificationFailed: (FirebaseAuthException error) {
            // show error message
            isSigningUp = false; // setstate

            _showSnackBar(context, 'Verification error');
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // getLocation();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    if (isSigningUp)
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return isOtp
        ? Scaffold(
            //  appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
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
                    children: [
                      Expanded(
                        child: PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.blue.shade50,
                          enableActiveFill: true,
                          controller: _otpController,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                          appContext: context,
                        ),
                      )
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      // onPressed: () => {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: ((BuildContext context) =>
                      //                   const SignInPage()))),
                      //      }
                      onPressed: () => handleVerifyOtp(),
                    ),
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
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: loading
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(color: AppColors.orange),
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
                                    height: 240,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assets/images/gebeta_logo.png",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // CustomerHotelOwnerToggle(
                                  //    isCustomer: _roleIsCustomer,
                                  //     isHotelOwner: _roleIsHotel),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 25.0),
                                    child: CustomTextField(
                                      name: 'Name',
                                      controller: _nameController,
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      loading: loading,
                                      validator: _validateName,
                                      onChange: (val) {
                                        setState(() {
                                          _name = val;
                                        });
                                      },
                                      hintText: "Full Name",
                                    ),
                                  ),
                                  CustomTextField(
                                    hintText: "johndoe@gmail.com",
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    name: 'Email',
                                    validator: _validateEmail,
                                    loading: loading,
                                    obscureText: false,
                                    onChange: (val) {
                                      setState(() {
                                        _email = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // CustomTextField(
                                  //   hintText: "090000000",
                                  //   controller: _phoneController,
                                  //   keyboardType: TextInputType.number,
                                  //   maxLength: 13,
                                  //   name: 'Phone',
                                  //   validator: _validatePhone,
                                  //   loading: loading,
                                  //   obscureText: false,
                                  //   onChange: (val) {
                                  //     setState(() {
                                  //       _phone = val;
                                  //     });
                                  //   },
                                  // ),
                                  TextFormField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 14,
                                    readOnly: false,
                                    decoration: InputDecoration(
                                      hintText: "940502345",
                                      // hide max character counter
                                      counter: Offstage(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8.0)),

                                      prefixIcon: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        width: 80,
                                        child: Row(
                                          children: [
                                            CustomIcon(
                                              icon: Icons.phone,
                                              iconColor: Colors.black,
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

                                  CustomTextField(
                                      name: 'Password',
                                      showPassword: showPassword,
                                      onChange: (val) {
                                        setState(() {
                                          _password = val;
                                        });
                                      },
                                      obsecureSuffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                          icon: showPassword
                                              ? Icon(Icons.visibility_outlined,
                                                  color: Colors.black54,
                                                  size: 20)
                                              : Icon(Icons.visibility_off,
                                                  color: Colors.black54,
                                                  size: 20)),
                                      hintText: 'Pick a strong password',
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      validator: _validatePassword,
                                      loading: loading,
                                      controller: _passwordController),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: CustomBtn(
                              color: AppColors.orange,
                              text: 'Sign Up',
                              loading: loading,
                              onPressed: () => handleSignUp(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
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
                                      ScaleRoute(page: const SignInPage()));
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
                        ],
                      ),
                    ),
                  ),
          );
  }
}
