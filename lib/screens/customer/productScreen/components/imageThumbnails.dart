import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class ImageThumbnail extends StatelessWidget {
  final onTap;
  final image;
  final images;
  final currentPage;
  const ImageThumbnail(
      {Key? key, this.onTap, this.image, this.images, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(3),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.orange, width: 2),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              )),
          if (images.indexOf(image) == currentPage)
            Container(
              margin: EdgeInsets.fromLTRB(1, 2, 1, 5),
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
    );
  }
}