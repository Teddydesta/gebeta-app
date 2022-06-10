
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/DetailScreen/popularProductDetail.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Container(
      margin: EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                product.images![0],
              ))),
    );

    final name = Text(
      product.name!,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      overflow: TextOverflow.ellipsis,
    );

    final category = Text(
      product.category!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
    );

    final price = Text(
      "${product.price.toString()} birr",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Color(0xFF0077b6), fontWeight: FontWeight.bold, fontSize: 15),
    );

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext builder) => PopularProductDetails(
                    product: product,
                  ))),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(20),
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
            Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 12, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  name,
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: category),
                      Container(child: price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}