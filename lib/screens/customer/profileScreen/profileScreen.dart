import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/CartHistoryScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/accountWidget.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

import '../../authScreen/signIn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/real/user.jpg"))),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const CustomText(text: "My Account")),
                        const SizedBox(height: 35),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),

                    //Phone Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AccountWidget(
                          appIcon: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.settings,
                            iconSize: 24,
                            size: 45,
                          ),
                          customText: const CustomText(
                            text: 'settings',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),

                    //Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AccountWidget(
                          appIcon: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.location_on,
                            iconSize: 24,
                            size: 45,
                          ),
                          customText: const CustomText(
                            text: 'Manage addresses',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const CartHistory()))),
                          child: AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: Colors.white,
                              icon: Icons.delivery_dining_outlined,
                              iconSize: 24,
                              size: 45,
                            ),
                            customText: const CustomText(
                              text: 'My Orders',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AccountWidget(
                          appIcon: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.privacy_tip,
                            iconSize: 24,
                            size: 45,
                          ),
                          customText: const CustomText(
                            text: 'Privacy Policy',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AccountWidget(
                          appIcon: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.help,
                            iconSize: 24,
                            size: 45,
                          ),
                          customText: const CustomText(
                            text: 'Help',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const CustomIcon(
                            backgroundColor: Colors.white,
                            icon: Icons.arrow_forward_ios,
                            iconColor: AppColors.placeholder,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const SignInPage()))),
                      child: CustomBtn(
                          text: "LOGOUT",
                          color: AppColors.orange,
                          height: 60,
                          width: 400,
                          borderRadius: 8.0,
                          fontSize: 30,
                          textColor: Colors.white,
                          fontWeight: FontWeight.normal,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const HomeMainScreen())));
                          }),
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
