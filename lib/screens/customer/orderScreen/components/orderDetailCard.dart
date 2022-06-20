import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/CartModel.dart';
import 'package:gebeta_food_delivery/services/cartService.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({Key? key}) : super(key: key);
  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool loading = false;
  CartServices _cartServices = CartServices();
  ProductServices _productServices = ProductServices();
  List<CartModel> cartproducts = [];
  var quantity = 1;
  var totalPrice = '';
  _showSnackBar(context, text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: CustomText(text: text)));
  }

  getCartItems() async {
    print("start");
    setState(() {
      loading = false;
    });

    var res = await _cartServices.getCartItem();
    //  print(res);
    if (res == null) {
      //print("Error getting product");
      _showSnackBar(context, 'Error getting product, please try again');
      setState(() {
        loading = false;
      });
      return;
    }
    totalPrice = res['totalPrice'].toString();

    List<CartModel> response = (res['items']['products'] as List)
        .map((h) => CartModel.fromJson(h))
        .toList();

    // print(res['items']['products']);
    setState(() {
      cartproducts.clear();
      cartproducts.addAll(response);
      loading = false;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 25),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(0.5, 1.0),
                blurRadius: 5,
                spreadRadius: 1.0),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/food0.png"))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: CustomText(text: "name")),
                    Container(child: CustomText(text: "description")),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(child: CustomText(text: "price")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
