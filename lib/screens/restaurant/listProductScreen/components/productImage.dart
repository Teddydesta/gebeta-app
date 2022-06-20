import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final pad;
  final image;
  const ProductImage({Key? key, this.pad, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}