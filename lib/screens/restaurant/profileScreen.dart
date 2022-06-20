import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/new_passwordscreen.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/address_screen/address_screen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Orders/OrderScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/profileScreen/updateProfile.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/accountWidget.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class HotelProfileScreen extends StatefulWidget {
  HotelProfileScreen({Key? key}) : super(key: key);

  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
   bool loading = false;
  final UserServices _userServices = UserServices();
   late HotelModel hotel;

  getHotelInfo() async {
    print("start");
    setState(() {
      loading = true;
    });
    var res = await _userServices.getHotelProfile();
    print(res);
    if (res == null) {
      // _showSnackBar(context, 'Error getting Information, please try again');

      return;
    }

    setState(() {
      loading = false;
      hotel = res;
    });

    print(hotel.name);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getHotelInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(text: "User Profile",fontWeight: FontWeight.bold,),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 0, left: 20),
        padding: EdgeInsets.only(top: 15),
        width: double.maxFinite,
        child: //loading
           // ? Center(child: CircularProgressIndicator())
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Babis"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(text: "0978654343"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(text: "babis@gmail.com"),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              UpdateProfile(
                                                email: 'email',
                                                name: 'name',
                                                phone: 'phone',
                                              ))),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: CustomText(
                                      text: "Edit",
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),

                          Divider(
                            color: Colors.grey[100],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const CustomText(
                              text: "My Account",
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 10),

                          //Phone Number
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        UpdateProfile(
                                          email: 'email',
                                          name: 'name',
                                          phone: 'phone',
                                        )))),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[50]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AccountWidget(
                                    appIcon: const CustomIcon(
                                      backgroundColor: Colors.amberAccent,
                                      icon: Icons.person,
                                      iconColor: Colors.white,
                                      iconSize: 24,
                                      size: 38,
                                    ),
                                    customText: const CustomText(
                                      text: 'Profile Setting',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const CustomIcon(
                                      iconSize: 22,
                                      icon: Icons.arrow_forward_ios,
                                      backgroundColor: Colors.white12,
                                      iconColor: AppColors.placeholder,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          //Address
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const NewPasswordScreen()))),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[50]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AccountWidget(
                                    appIcon: const CustomIcon(
                                      backgroundColor: Colors.cyan,
                                      icon: Icons.lock,
                                      iconSize: 24,
                                      size: 38,
                                    ),
                                    customText: const CustomText(
                                      text: 'Change password',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const CustomIcon(
                                      iconSize: 22,
                                      backgroundColor: Colors.white12,
                                      icon: Icons.arrow_forward_ios,
                                      iconColor: AppColors.placeholder,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        MapScreen()))),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[50]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AccountWidget(
                                    appIcon: const CustomIcon(
                                      backgroundColor: Colors.green,
                                      icon: Icons.location_on,
                                      iconColor: Colors.white,
                                      iconSize: 24,
                                      size: 38,
                                    ),
                                    customText: const CustomText(
                                      text: 'Add Your Address',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const CustomIcon(
                                      iconSize: 22,
                                      backgroundColor: Colors.white12,
                                      icon: Icons.arrow_forward_ios,
                                      iconColor: AppColors.placeholder,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[50]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AccountWidget(
                                  appIcon: const CustomIcon(
                                    backgroundColor: AppColors.orange,
                                    icon: Icons.checklist_outlined,
                                    iconColor: Colors.white,
                                    iconSize: 24,
                                    size: 38,
                                  ),
                                  customText: const CustomText(
                                    text: 'My Orders',
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HotelOrderScreen())),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const CustomIcon(
                                      iconSize: 22,
                                      icon: Icons.arrow_forward_ios,
                                      backgroundColor: Colors.white12,
                                      iconColor: AppColors.placeholder,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const SignInPage()))),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 40, top: 250),
                              child: Container(
                                child: Container(
                                  child: Center(
                                    child: CustomText(
                                      text: "LOGOUT",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
 
}