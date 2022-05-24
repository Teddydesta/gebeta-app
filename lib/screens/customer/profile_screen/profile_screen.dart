import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/new_passwordscreen.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/address_screen/address_screen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/components/profile_setting.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/accountWidget.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          text: "Profile ",
          fontSize: 34,
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          
          children: [
            Divider(
                      color: AppColors.orange,
                    ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    //Profile
                    Center(
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/real/user.jpg"))),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Divider(
                      color: Colors.grey[100],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width15),
                      child: const CustomText(
                        text: "Account",
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),

                    //Phone Number
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const ProfileSettingScreen()))),
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
                                  const NewPwScreen()))),
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
                                  const Addressscreen()))),
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const ProfileScreen()))),
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
                                backgroundColor: Colors.black,
                                icon: Icons.dark_mode,
                                iconColor: Colors.white,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Dark Mode',
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
                              text: 'Orders',
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
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CustomText(
                        text: "Personal",
                        fontSize: 22,
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
                              backgroundColor: Colors.purple,
                              icon: Icons.policy_rounded,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Privacy Policy',
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
                    const SizedBox(
                      height: 5,
                    ),
                    //Address
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
                              backgroundColor: AppColors.primary,
                              icon: Icons.lock_outline_rounded,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Security',
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
                              icon: Icons.description_outlined,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Term & Conditions',
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

                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: Colors.brown,
                              icon: Icons.help_outline,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Help',
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            child: const CustomIcon(
                              backgroundColor: Colors.white12,
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              iconColor: AppColors.placeholder,
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
                      onTap: () => Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const SignInPage()))),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            bottom: Dimensions.height40),
                        child: CustomBtn(
                            text: "LOGOUT",
                            color: AppColors.orange,
                            height: Dimensions.height40,
                            width: Dimensions.width450,
                            borderRadius: 5.0,
                            fontSize: 30,
                            textColor: Colors.white,
                            fontWeight: FontWeight.normal,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((BuildContext context) =>
                                          const SignInPage())));
                            }),
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
