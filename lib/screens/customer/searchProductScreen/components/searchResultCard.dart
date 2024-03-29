import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/DispatchedProduct.dart';
import 'package:gebeta_food_delivery/models/Product.dart';


class SearchResultCard extends StatelessWidget {
  final Product product;
  const SearchResultCard({Key? key, required this.product, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final image = Container(
      height: 70,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(product.images![0]), fit: BoxFit.cover)),
    );
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //             DetailScreen(product: product))),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 8),
        height: 100,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.5,
                  spreadRadius: 2.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: image,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            child: Text(
                              product.name!,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Text(
                      product.description!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}