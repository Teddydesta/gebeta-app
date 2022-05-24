// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';

class SearchBar extends StatelessWidget {
  final String title;
  const SearchBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: TextField(
          onTap: (() {}),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.orange,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const CustomIcon(
                icon: Icons.search,
                backgroundColor: Colors.white30,
                iconColor: AppColors.orange,
                iconSize: 24,
              ),
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 17,
            ),
          ),
        ),
      ),
    );
  }
}
