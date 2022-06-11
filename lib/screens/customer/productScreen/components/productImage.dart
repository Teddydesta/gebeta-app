import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final pad;
  final image;
  const ProductImage({Key? key, this.pad, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(5, pad, 5, pad),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}