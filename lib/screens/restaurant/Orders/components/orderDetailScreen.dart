import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/CartModel.dart';
import 'package:gebeta_food_delivery/screens/customer/address_screen/address_screen.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/services/cartService.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
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

  increaseItems(String? id, index) async {
    print("start");
    var res = await _cartServices.updateQuantity(productID: id);
    setState(() {
      quantity++;
      var a = int.parse(totalPrice) + cartproducts[index].price;
      totalPrice = a.toString();
      loading = false;
    });

    print(res);
  }

  //decreement
  decreaseItems(String? id, index) async {
    print("start");
    var res = await _cartServices.updateQuantity(productID: id);
    setState(() {
      quantity--;
      var a = int.parse(totalPrice) + cartproducts[index].price;
      totalPrice = a.toString();
      loading = false;
    });

    print(res);
  }

//delet cart items
  deleteCartItems(String? id) async {
    print("start");
    setState(() {
      loading = false;
    });

    var res = await _cartServices.deleteCartItem(productID: id);
    print(res);
  }

  @override
  void initState() {
    getCartItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              leading: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeMainScreen())),
                  child: CustomIcon(
                    icon: Icons.arrow_back,
                    iconColor: Colors.black,
                    iconSize: 24,
                    backgroundColor: Colors.white,
                  )),
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Order History",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartproducts.length,
                        itemBuilder: (context, index) {
                          return loading
                              ? CircularProgressIndicator()
                              : Container(
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: Offset(0.5, 1.0),
                                              blurRadius: 6.5,
                                              spreadRadius: 1.0),
                                        ]),
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        cartproducts[index]
                                                            .product
                                                            .images![0])),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 15, left: 10),
                                                  width: 100,
                                                  child: CustomText(
                                                    maxLine: 1,
                                                    text: cartproducts[index]
                                                        .name,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        decreaseItems(
                                                            cartproducts[index]
                                                                .id,
                                                            index);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: CircleBorder(),
                                                        primary: Colors.white,
                                                        minimumSize:
                                                            const Size(30, 30),
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.grey,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    CustomText(
                                                      text: "$quantity",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        increaseItems(
                                                            cartproducts[index]
                                                                .id,
                                                            index);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: CircleBorder(),
                                                        primary: Colors.white,
                                                        minimumSize:
                                                            const Size(20, 20),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.grey,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => deleteCartItems(
                                                      cartproducts[index].id),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20, left: 10),
                                                    child: CustomIcon(
                                                      icon: Icons.delete,
                                                      iconSize: 24,
                                                      iconColor:
                                                          AppColors.orange,
                                                      backgroundColor:
                                                          Colors.white30,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                CustomText(
                                                  text:
                                                      "ETB${totalPrice.toString()}",
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.orange,
                                                  fontSize: 16,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 15, top: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Bill Details",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Item Total"),
                              CustomText(text: "${totalPrice.toString()} Birr")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Delivery Charges"),
                              CustomText(text: "50 Birr")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Total Discount"),
                              CustomText(text: "0.0 Birr")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
