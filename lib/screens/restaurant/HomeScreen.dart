import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Orders/OrderScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/addProductScreen/AddNewProducts.dart';
import 'package:gebeta_food_delivery/screens/restaurant/productScreen/productScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/profileScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/updateProductScreen.dart';
import 'package:gebeta_food_delivery/services/userServices.dart';
import 'package:geolocator/geolocator.dart';

class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({Key? key}) : super(key: key);

  @override
  _RestaurantHomeScreenState createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
  var locationMessage = "";
  bool loading = true;
  UserServices _userServices = UserServices();
  List<HotelModel> hotels = [];
  var lat = 0.0;
  var lng = 0.0;

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

//
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
          children: <Widget>[
            ProductsScreen(),
            AddNewProductPage(),
            HotelOrderScreen(),
            HotelProfileScreen(),
          ],
        ),
      ),

      //floatingActionButton: _getFAB(),
      //Botom Nav bar
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.grey[200],
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black,
              title: const Text('Home'),
              icon: const Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black87,
              title: const Text('Add'),
              icon: const Icon(Icons.add)),
          BottomNavyBarItem(
            activeColor: Colors.black,
            inactiveColor: Colors.black87,
            title: const Text('Orders'),
            icon: const Icon(Icons.checklist_outlined),
          ),
          BottomNavyBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black87,
              title: const Text('Profile'),
              icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}

Widget _getFAB() {
  return FloatingActionButton.extended(
      label: const Text('Add Product'),
      icon: const Icon(Icons.add),
      backgroundColor: Colors.black,
      onPressed: () {
        AddNewProductPage();
      }
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => AddNewProductPage())),
      );
}
