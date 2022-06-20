import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/searchProductScreen/ProductSearchDcreen.dart';
import 'package:gebeta_food_delivery/services/cartService.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class MenuDetailScreen extends StatefulWidget {
  final HotelModel hotel;
  const MenuDetailScreen({
    Key? key, required this.hotel,
  }) : super(key: key);

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  bool loading = false;
  CartServices _cartServices = CartServices();
 _showSnackBar(context, text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: CustomText(text: text)));
  }
  
  addFoodToCart(String? id) async {
    // var addToCart = await _productServices.addProduct(

    print('start ${id}');
    var res = await _cartServices.addFoodToCart(productID: id);
    print(res);
  }

  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  getResturantProduct() async {
    print("start");
    setState(() {
      loading = true;
    });
    products.clear();
   // var res = await _productServices.getProducts(widget.hotel.id);
   var res = await _productServices.getResturantsProducts(widget.hotel.id);
    print(res);
    if (res == null) {
      // _showSnackBar(context, 'Error getting product, please try again');
      setState(() {
        loading = false;
      });
      return;
    }
    List<Product> response = res;
    print(response);
    setState(() {
      products.clear();
      products.addAll(response);
      loading = false;
    });
  }

  @override
  void initState() {
    getResturantProduct();
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
        : Container(
            width: double.maxFinite,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: AppColors.orange,
                ),
                //SearchProductScreen(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Recommended",
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () => _menu(context),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: CustomText(
                          text: "MENU",
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                const Divider(
                  color: AppColors.placeholder,
                ),

                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              products[index].images![0])),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: products[index].name!,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 150,
                                        child: CustomText(
                                          maxLine: 2,
                                          text: products[index].description!,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        text:
                                            "ETB${products[index].price.toString()}",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.orange,
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  
                                    GestureDetector(
                                      onTap: () {
                                        addFoodToCart(products[index].id);
                                        _cartDialog(context);
                                          
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainBlackColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Center(
                                            child: GestureDetector(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder:
                                          //             (BuildContext context) =>
                                          //                 BasketScreen())),
                                          child: CustomText(
                                            text: "Add",
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        )),
                                      ),
                                    ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: AppColors.placeholder,
                ),
              ],
            ),
          );
  }
}

///
void _menu(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.only(top: 200, left: 0, right: 200, bottom: 280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "Recommended"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "doner"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "gril dish"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "oven/firin"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "pizza"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "desert"),
            ),
          ],
        ),
      );
    },
  );
}

void _cartDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BasketScreen())),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          height: 50,
          margin:
              const EdgeInsets.only(top: 750, left: 15, right: 15, bottom: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Center(child: Center(child: CustomText(text: "View You Cart",fontWeight: FontWeight.bold,)))
            ],
          ),
        ),
      );
    },
  );
}
