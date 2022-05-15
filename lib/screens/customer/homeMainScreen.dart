import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/HomeScreen/homeScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/searchScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/profileScreen.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

import '../../utils/colors.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const [
            HomeScreen(),
            SearchScreen(),
            BasketScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      //Botom Nav bar
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: AppColors.orange,
              inactiveColor: Colors.black,
              title: const Text('Nearby'),
              icon: const Icon(Icons.local_restaurant_outlined)),
          BottomNavyBarItem(
              activeColor: AppColors.orange,
              inactiveColor: Colors.black,
              title: const Text('Search'),
              icon: const Icon(Icons.search)),
          BottomNavyBarItem(
            activeColor: AppColors.orange,
            inactiveColor: Colors.black,
            title: const Text('Cart'),
            icon: const Icon(Icons.shopping_basket_outlined),
          ),
          BottomNavyBarItem(
              activeColor: AppColors.orange,
              inactiveColor: Colors.black,
              title: const Text('Profile'),
              icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}
