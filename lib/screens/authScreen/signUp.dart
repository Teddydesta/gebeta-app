// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gebeta_food_delivery/screens/animation/scaleRoute.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/customerHotelToggle.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/signUpBtn.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/formFilld.dart';

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

  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _phone;
  TextEditingController _phoneController = TextEditingController();
  String? _password;
  TextEditingController _passwordController = TextEditingController();
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
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  onSubmitForm(context) async {
    if (_location.isEmpty) {
      await getLocation();
      _showSnackBar(context, 'Location coordinates are required');
    }
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      var res;
      if (_isCustomer) {
        res = await userServices.registerUser(
            name: _name,
            phone: widget.phone,
            location: _location,
            password: _password);
      } else {
        res = await userServices.registerHotel(
            name: _name,
            phone: widget.phone,
            location: _location,
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

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
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
                              height: 200,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/gebeta_logo.png",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomerHotelToggle(
                                isCustomer: _roleIsCustomer,
                                isHotel: _roleIsHotel),
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
                              hintText: "090000000",
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              maxLength: 13,
                              name: 'Phone',
                              validator: _validatePhone,
                              loading: loading,
                              onChange: (val) {
                                setState(() {
                                  _phone = val;
                                });
                              },
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
                                            color: Colors.black54, size: 20)
                                        : Icon(Icons.visibility_off,
                                            color: Colors.black54, size: 20)),
                                hintText: 'Pick a strong password',
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: _validatePassword,
                                loading: loading,
                                controller: _passwordController),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: CustomBtn(
                                text: 'Sign Up',
                                loading: loading,
                                onPressed: () => onSubmitForm(context),
                              ),
                            )
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
