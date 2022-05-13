import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/searchScreen/components/searchBar.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                SearchBar(title: 'Search for restaurants, dishes'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
