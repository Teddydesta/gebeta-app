import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/RestaurantPage/RestaurantScreen.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pageViewContainer,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((BuildContext context) =>
                    const RestaurantMainScreen()))),
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, i) {
              return Container(
                height: Dimensions.pageView,
                width: 120,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/food11.png"),
                      fit: BoxFit.cover),
                ),
              );
            }),
      ),
      // const Icon(Icons.wallpaper_rounded, size: 80, color: Colors.grey)
    );
  }
}
