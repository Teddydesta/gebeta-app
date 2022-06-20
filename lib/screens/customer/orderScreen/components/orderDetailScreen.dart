import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/orderScreen/components/orderCard.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(text: "Order Detail Screen"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => OrderCard(
                //product: products[index],
                ),
          )),
    );
  }
}
