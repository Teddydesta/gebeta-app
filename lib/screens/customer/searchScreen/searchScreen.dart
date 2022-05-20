import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchBar.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 0),
            color: Colors.lightBlue,
          ),
          const SearchBar(title: "Search for restaurants, dishes")
        ],
      ),
    );
  }
}
