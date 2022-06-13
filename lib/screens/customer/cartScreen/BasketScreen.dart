import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/hotelMenuScreen/hotelMenuScreen.dart';
import 'package:gebeta_food_delivery/services/cartService.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool loading = false;
  CartServices _cartServices = CartServices();
  ProductServices _productServices = ProductServices();

  List<Product> products = [];
  getCartItems() async {
    print("start");
    setState(() {
      loading = true;
    });
    products.clear();
    var res = await _cartServices.getCartItems();
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 20),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.orange, Color(0xFFfbab66)],
                  begin: FractionalOffset(0.2, 0.2),
                  end: FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            //color: AppColors.orange,
            margin: EdgeInsets.only(top: 0, bottom: 0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  HotelMenuScreen()))),
                      child: const CustomIcon(
                        icon: Icons.arrow_back_ios,
                        backgroundColor: AppColors.orange,
                        iconColor: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    const CustomText(
                      text: "REMAS ",
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),

                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.white38,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                                    color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage("assets/images/food0.png"))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Burger",fontWeight: FontWeight.bold,),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(text: "Description"),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(text: "ETB123")
                          ],
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: getCartItems,
                                child: CustomIcon(
                                    icon: Icons.remove,
                                    iconSize: 24,
                                    backgroundColor: Colors.white)),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: CustomText(
                                  fontSize: 24,
                                  text: "0",
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIcon(
                              icon: Icons.add,
                              iconSize: 24,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          // ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         itemCount: products.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             color: Colors.grey,
          //             child: Container(
          //               margin: EdgeInsets.only(left: 10, right: 10),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   SizedBox(
          //                     height: 35,
          //                   ),
          //                   Row(
          //                     mainAxisAlignment:
          //                         MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Container(
          //                         height: 60,
          //                         width: 70,
          //                         decoration: BoxDecoration(
          //                           image: DecorationImage(
          //                               image: NetworkImage(
          //                                   products[index].images![0])),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 10,
          //                       ),
          //                       Column(
          //                         crossAxisAlignment:
          //                             CrossAxisAlignment.start,
          //                         children: [
          //                           CustomText(
          //                             text: products[index].name!,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                           SizedBox(
          //                             height: 5,
          //                           ),
          //                           Container(
          //                             width: 180,
          //                             child: CustomText(
          //                               maxLine: 2,
          //                               text: products[index].description!,
          //                               fontSize: 15,
          //                             ),
          //                           ),
          //                           SizedBox(
          //                             height: 5,
          //                           ),
          //                           CustomText(
          //                             text:
          //                                 "ETB${products[index].price.toString()}",
          //                             fontWeight: FontWeight.w400,
          //                             color: AppColors.orange,
          //                             fontSize: 16,
          //                           ),
          //                         ],
          //                       ),
          //                       const SizedBox(
          //                         width: 30,
          //                       ),

          //                        Container(
          //                         width: 100,
          //                         color: Colors.grey,
          //                         child: Row(
          //                           children: [
          //                             Icon(Icons.remove,),
          //                             CustomText(text: "0"),
          //                             Icon(Icons.add)
          //                           ],
          //                         ),
          //                        ),

          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           );
          //         }),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey[350],
          ),
          Container(
              margin: const EdgeInsets.only(left: 15, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Bill Detail",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "Item Total"),
                      CustomText(text: "ETB240.00")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "Distance Range"),
                      CustomText(text: "28 KM")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "delivery Charges"),
                      CustomText(text: "ETB25")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: " Total Discount"),
                      CustomText(text: "ETB0.00")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "To  Pay"),
                      CustomText(text: "ETB240.00")
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey[350],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomText(
                  text: "Order Type",
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CustomIcon(
                      icon: Icons.circle_outlined,
                      iconColor: AppColors.orange,
                      backgroundColor: Colors.white,
                      iconSize: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(text: "Delivery"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Divider(
            color: Colors.grey[300],
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const PaymentScreen()))),
            child: Container(
              child: Center(
                child: CustomText(
                  text: "CHECKOUT",
                  color: Colors.white,
                ),
              ),
              height: 50,
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
