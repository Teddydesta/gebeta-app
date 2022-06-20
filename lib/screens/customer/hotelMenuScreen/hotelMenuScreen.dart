import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/hotelMenuScreen/Components/menuDetailScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class HotelMenuScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  final HotelModel hotel;
  const HotelMenuScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  _HotelMenuScreenState createState() => _HotelMenuScreenState();
}

class _HotelMenuScreenState extends State<HotelMenuScreen> {
  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: CustomText(text: text)));
  }



  List<HotelModel> hotels = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((BuildContext context) =>  HomeMainScreen()))),
          child: CustomIcon(
            icon: Icons.arrow_back,
            iconSize: 24,
            backgroundColor: Colors.white,
          ),
        ),
        title: CustomText(
          text: "Food Menu",
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton(
              color: Colors.white,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  // _value = value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Default"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            iconSize: 24,
                            backgroundColor: Colors.white,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Name: A - Z"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            iconSize: 24,
                            backgroundColor: Colors.white,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Name: Z - A"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Price: Low to High"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: "Price: High to Low"),
                          CustomIcon(
                            icon: Icons.circle_outlined,
                            backgroundColor: Colors.white,
                            iconSize: 24,
                            iconColor: AppColors.placeholder,
                          ),
                        ],
                      ),
                      value: () {},
                    ),
                  ])
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/restaurant_cover.png"))),
                  ),

                  // SearchScreen(),
                  SizedBox(height: 15),
                  MenuDetailScreen(hotel: widget.hotel),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
