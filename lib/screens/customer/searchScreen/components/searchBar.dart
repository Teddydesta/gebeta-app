// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class SearchBar extends StatelessWidget {
  final String title;
  const SearchBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.orange)),
            prefixIcon: Image.asset(
              "assets/images/virtual/search_filled.png",
              height: 30.0,
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.only(
              top: 17,
            ),
          ),
        ),
      ),
    );
  }
}
