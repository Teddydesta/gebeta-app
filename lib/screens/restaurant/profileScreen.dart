import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/DeliveredProducts.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/new_passwordscreen.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Category/CategoryPage.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Orders/Ordersscreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/addProductScreen/components/ListProducts.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/accountWidget.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RestaurantProfileScreen extends StatefulWidget {
  const RestaurantProfileScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantProfileScreen> createState() => _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen> {
  bool loading = false;
  final UserServices _userServices = UserServices();
  late Hotel user;

  getUserInfo() async {
    print("start");
    setState(() {
      loading = true;
    });
    var res = await _userServices.getUserProfile();
    if (res == null) {
      // _showSnackBar(context, 'Error getting Information, please try again');

      return;
    }

    setState(() {
      loading = false;
      user = res;
    });

    print(user.name);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Hotel Owner Profile",style: TextStyle(color: Colors.black),),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile
                    
                    Divider(
                      color: Colors.grey[100],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CustomText(
                        text: "Account",
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),

                    //Phone Number
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
                              backgroundColor: Colors.amberAccent,
                              icon: Icons.person,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Profile Setting',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              iconColor: AppColors.placeholder,
                              backgroundColor: Colors.white10,
                              size: 20,
                            ),
                          ),
                        ],
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
                                backgroundColor: Colors.cyan,
                                icon: Icons.lock,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Change password',
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                icon: Icons.arrow_forward_ios,
                                backgroundColor: Colors.white10,
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
                              backgroundColor: Colors.white,
                              icon: Icons.location_on,
                              iconColor: AppColors.orange,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Add Address',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              iconColor: AppColors.placeholder,
                              backgroundColor: Colors.white10,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CustomText(
                        text: "Restaurant",
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),

                    //Phone Number
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const CategoriesScreen()))),
                      child: Container(
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
                                backgroundColor: Colors.amber,
                                icon: Icons.category_outlined,
                                iconColor: Colors.white,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Categories',
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                icon: Icons.arrow_forward_ios,
                                iconColor: AppColors.placeholder,
                                backgroundColor: Colors.white10,
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
                                   ListProductScreen()))),
                      child: Container(
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
                                backgroundColor: AppColors.secondary,
                                icon: Icons.add,
                                iconColor: Colors.white,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Products',
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                icon: Icons.arrow_forward_ios,
                                iconColor: AppColors.placeholder,
                                backgroundColor: Colors.white10,
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
                                  const ListProductScreen()))),
                      child: Container(
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
                                text: 'Orders',
                                color: Colors.black,
                              ),
                            ),
                            
                          
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child:  GestureDetector(
                                  onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const OrdersScreen()))),
                                  child: CustomIcon(
                                    iconSize: 22,
                                    icon: Icons.arrow_forward_ios,
                                    iconColor: AppColors.placeholder,
                                    backgroundColor: Colors.white10,
                                    size: 20,
                                  ),
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
                              backgroundColor: Colors.green,
                              icon: Icons.check_rounded,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Delivery',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              iconColor: AppColors.placeholder,
                              backgroundColor: Colors.white10,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                   
                    const SizedBox(
                      height: 65,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const SignInPage()))),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 30),
                        child: Container(
                     child: Center(child: CustomText( text: "LOGOUT",
                     color: Colors.white,fontWeight: FontWeight.bold,),),                     
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
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
