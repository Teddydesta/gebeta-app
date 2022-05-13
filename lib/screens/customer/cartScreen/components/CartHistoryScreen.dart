import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "History"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [CustomText(text: "Your Cart History is here.")],
        ),
      ),
    );
  }
}
