import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/services/common.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/locationUtils.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';
import 'package:image_picker/image_picker.dart';




class UpdateProfile extends StatefulWidget {
  final String name, email, phone;
  const UpdateProfile(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LocationUtils _locationUtils = new LocationUtils();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  Map _location = {};
  bool _isUser = false;
  List<String> categories = [];


  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _email;
  TextEditingController _emailController = TextEditingController();
  String? _category;
  String? _phone;
  TextEditingController _phoneController = TextEditingController();

  String role = '';

  CommonServices _commonServices = CommonServices();
  var userServices = UserServices();

  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
      duration: Duration(seconds: 3),
    ));
  }

  _roleIsUser() {
    _isUser = true;
    print(_isUser);
  }

  _roleIBroker() {
    _isUser = false;
    print(_isUser);
  }

  _clearState() {
    _formKey.currentState!.reset();
    
   
    _phoneController.clear();
    _nameController.clear();
    _emailController.clear();
    setState(() {
      _category = null;
    });
  }

  _validateText(String value, error) {
    value.trim();
    if (value.isEmpty) return error;
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

  _validateName(String value) {
    value.trim();
    if (value.isEmpty) return 'Please enter your name';
    if (double.tryParse(value) != null) return 'Only text are allowed';

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

  getRole() async {
    String userrole = await _commonServices.getRole();

    setState(() {
      role = userrole;
    });
  }

  _updateProfile() async {
    if (_location.isEmpty) {
      await getLocation();
      if (_location.isEmpty) {
        _showSnackBar(context,
            'Location coordinates are required, please turn on location service');
        return;
      }
    }
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      var res = await userServices.updateProfile(
        name: _nameController.value.text,
        phone: _phoneController.value.text,
        email: _emailController.value.text,

        //location: _location,
      );

      if (res == 404) {
        _showSnackBar(context, 'Error in Updating profile, please try again');
        setState(() {
          loading = false;
        });
        return;
      }
      _showSnackBar(context, 'Profile successfully Updated.');
      // _clearState();
      // setState(() {
      //   loading = false;
      // });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ProfileScreen()),
          ModalRoute.withName('/'));
      return;
    }
  }

  getLocation() async {
    print('Fetching location ... ');
    var result = await _locationUtils.getCurrentPosition();
    print('result : $result');
    if (result['result'] == null) {
      _showSnackBar(context, "Error fetching location, ${result['error']}");
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
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    super.initState();
    getLocation();
    getRole();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text("Update User Profile",style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.grey.shade800),
            onPressed: loading ? null : () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                      child: CustomTextField(
                          name: 'Name',
                          onChange: (val) {
                            setState(() {
                              _name = val;
                            });
                          },
                          obscureText: false,
                          hintText: 'John Doe',
                          keyboardType: TextInputType.text,
                          validator: _validateName,
                          loading: loading,
                          controller: _nameController),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 25.0),
                      child: CustomTextField(
                          name: 'Email',
                          onChange: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                          obscureText: false,
                          hintText: 'John@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                          loading: loading,
                          controller: _emailController),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 25.0),
                      child: CustomTextField(
                          name: 'Phone',
                          onChange: (val) {
                            setState(() {
                              _phone = val;
                            });
                          },
                          obscureText: false,
                          hintText: '091122334455',
                          keyboardType: TextInputType.phone,
                          validator: _validatePhone,
                          loading: loading,
                          controller: _phoneController),
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 20),
                    // AddProductButton(
                    //   loading: loading,
                    //   onPressed: loading
                    //       ? null
                    //       : () {
                    //           if (_images.length == 0) {
                    //             _formKey.currentState!.validate();
                    //             _showSnackBar(context, 'Image is required');
                    //             return;
                    //           }
                    //           //_addProduct();
                    //         },
                    //   size: size,
                    // )

                    MaterialButton(
                      height: 58,
                      minWidth: 340,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12)),
                      onPressed: () => _updateProfile(),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      color: AppColors.orange,
                    ),
                  ],
                ),
              )),
        ));
  }
}