import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/HomeScreen/components/category.dart';
import 'package:gebeta_food_delivery/utils/helpers.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryCard(
              image: Image.asset(
                Helper.getAssetName("hamburger2.jpg", "real"),
                fit: BoxFit.cover,
              ),
              name: "Offers",
            ),
            const SizedBox(
              width: 10,
            ),
            CategoryCard(
              image: Image.asset(
                Helper.getAssetName("rice2.jpg", "real"),
                fit: BoxFit.cover,
              ),
              name: "Sri Lankan",
            ),
            const SizedBox(
              width: 10,
            ),
            CategoryCard(
              image: Image.asset(
                Helper.getAssetName("fruit.jpg", "real"),
                fit: BoxFit.cover,
              ),
              name: "Italian",
            ),
            const SizedBox(
              width: 10,
            ),
            CategoryCard(
              image: Image.asset(
                Helper.getAssetName("rice.jpg", "real"),
                fit: BoxFit.cover,
              ),
              name: "Indian",
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
