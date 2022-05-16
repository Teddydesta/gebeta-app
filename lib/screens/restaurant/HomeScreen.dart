import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Orders/Ordersscreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/profileScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Category/CategoryPage.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Products/ListProducts.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({Key? key}) : super(key: key);

  @override
  _RestaurantHomeScreenState createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
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

  //late final int _selectedIndex = 0;
  //List pages = [
  //const HomeMainScreen(),
  //const Center(child: Text('Next page')),
  //Container(
  // child: const Center(child: Text('Second page')),
  // ),
  //Container(
  //  child: const Center(child: Text('Third page')),
  //),
  // ];
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
          children: const <Widget>[
            ListProductScreen(),
            CategoriesScreen(),
            OrdersScreen(),
            RestaurantProfileScreen(),
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
              title: const Text('Product'),
              icon: const Icon(Icons.add)),
          BottomNavyBarItem(
              activeColor: AppColors.orange,
              inactiveColor: Colors.black87,
              title: const Text('Category'),
              icon: const Icon(Icons.category)),
          BottomNavyBarItem(
            activeColor: AppColors.orange,
            inactiveColor: Colors.black87,
            title: const Text('Orders'),
            icon: const Icon(Icons.checklist_outlined),
          ),
          BottomNavyBarItem(
              activeColor: AppColors.orange,
              inactiveColor: Colors.black87,
              title: const Text('Profile'),
              icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}
