import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

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
          ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Home'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) =>
                          const HomeMainScreen())))),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const ProfileScreen()))),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Basket'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) => const BasketScreen()))),
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) =>
                          const Drawer())))
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
