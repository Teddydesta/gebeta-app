import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Category/Components/addcategoryScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/CategoriesPage";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const CustomText(
          text: 'Categories',
          color: Colors.white,
          fontSize: 24,
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((BuildContext context) =>
                      const RestaurantHomeScreen()))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 24),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const AddCategoryPage())));
              },
              child: const CustomText(
                  text: 'Add', color: Colors.white, fontSize: 24))
        ],
      ),
      body: Center(
          child: Container(
              color: Colors.white,
              child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          children: const [
                            Icon(Icons.icecream),
                            SizedBox(
                              width: 25,
                            ),
                            CustomText(text: "Ice Cream")
                          ],
                        ),
                        color: Colors.grey[100],
                        height: 75,
                        width: double.maxFinite,
                        //color: AppColors.orange,
                        margin: const EdgeInsets.only(
                            bottom: 5, left: 20, right: 20, top: 10),
                      );
                    }),
              ))),
    );
  }
}
