import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/searchScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
             
            decoration: BoxDecoration(
              color: AppColors.orange,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/gebeta_logo.png'),
              ),
            ),
            padding: EdgeInsets.only(top: 110, left: 40),
            child: Center(
              child: Text(
                'Gebeta Delivery',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
Container(
  color: Colors.white,
  padding: EdgeInsets.only(left: 10),
  child:   Column(
  
    crossAxisAlignment: CrossAxisAlignment.start,
  
    children: [
  
      CustomText(text: "Home"),
  
        ListTile(
  
                leading:  CustomIcon(icon: Icons.local_restaurant_outlined,backgroundColor: Colors.white,iconColor: AppColors.orange,iconSize: 22,),
  
                title: const Text('Nearby'),
  
                onTap: () => Navigator.push(
  
                    context,
  
                    MaterialPageRoute(
  
                        builder: ((BuildContext context) =>
  
                            const HomeMainScreen())))),
  
            ListTile(
  
              leading: const CustomIcon(icon: Icons.search,iconColor: AppColors.orange,iconSize: 22,backgroundColor: Colors.white,),
  
              title: const Text('Search'),
  
              onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) =>
  
                           SearchScreen()))),
  
            ),
  
            ListTile(
  
              leading:  CustomIcon(icon: Icons.shopping_basket_outlined,backgroundColor: Colors.white,iconColor: AppColors.orange,iconSize: 22,),
  
              title: const Text('Basket'),
  
              onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) => const BasketScreen()))),
  
            ),
  
            ListTile(
  
              leading: const CustomIcon(icon: Icons.person,backgroundColor: Colors.white,iconColor: AppColors.orange,iconSize: 22,),
  
              title: const Text('Account'),
  
              onTap: () => {
  
                Navigator.push(
  
                    context,
  
                    MaterialPageRoute(
  
                        builder: ((BuildContext context) =>
  
                            const ProfileScreen())))
  
              },
  
            ),
            
            Divider(color: Colors.grey[40],),
            CustomText(text: "Personal"),
            ListTile(
  
              leading: const CustomIcon(icon: Icons.policy_rounded,iconColor: AppColors.orange,backgroundColor: Colors.white,iconSize: 22,),
  
              title: const Text('Privacy policy'),
  
             onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) => const SignInPage()))),
  
            ),
            ListTile(
  
              leading: const CustomIcon(icon: Icons.description_outlined,iconColor: AppColors.orange,iconSize: 22,backgroundColor: Colors.white,),
  
              title: const Text('Terms & Conditions'),
  
             onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) => const SignInPage()))),
  
            ),
            ListTile(
  
              leading: const CustomIcon(icon: Icons.help_outline,iconColor: AppColors.orange,backgroundColor: Colors.white,iconSize: 22,),
  
              title: const Text('Help'),
  
             onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) => const SignInPage()))),
  
            ),
            Divider(color: Colors.grey[40],),

            ListTile(
  
              leading: const CustomIcon(icon: Icons.exit_to_app,iconColor: AppColors.orange,backgroundColor: Colors.white,iconSize: 22,),
  
              title: const Text('Logout'),
  
             onTap: () => Navigator.push(
  
                  context,
  
                  MaterialPageRoute(
  
                      builder: ((BuildContext context) => const SignInPage()))),
  
            ),
  
    ],
  
  ),
),

        
        ],
      ),
    );
  }
}
