import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/restaurant/updateProdutScreen/updateProductScreen.dart';
import 'package:gebeta_food_delivery/services/productService.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool loading = false;
  ProductServices _productServices = ProductServices();

  deleteProduct(String? id) async {
    print("start");
    setState(() {
      loading = false;
    });

    var res = await _productServices.deletProduct();
    print(res);
  }

  List<Product> products = [];
  _deleteDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: 300, bottom: 300, left: 50, right: 50),
          padding: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          height: 150,
          child: Column(children: [
            CustomText(
              text: "Are you sure ?",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => deleteProduct(widget.product.id),
              child: Container(
                height: 40,
                width: 100,
                child: Center(child: CustomText(text: "Delete")),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
              ),
            ),
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = Container(
      margin: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.product.images![0],
              ))),
    );

    final name = Text(
      widget.product.name!,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      overflow: TextOverflow.ellipsis,
    );

    final category = Text(
      widget.product.category!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
    );

    final price = Text(
      "${widget.product.price.toString()} birr",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Color(0xFF0077b6), fontWeight: FontWeight.bold, fontSize: 15),
    );

    return Container(
      //width: 150,
      margin: EdgeInsets.only(left: 5, top: 10),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              name,
              Container(child: price),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Container(child: category),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UpdateProductScreen())),
                      child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.only(left: 10, top: 20),
                          child: Center(
                            child: CustomText(
                              text: "Update",
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    GestureDetector(
                      child: GestureDetector(
                        onTap: () => _deleteDialog(context),
                        child: Container(
                            height: 25,
                            width: 80,
                            margin: EdgeInsets.only(left: 20, top: 22),
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Center(
                              child: CustomText(
                                text: "Delete",
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
