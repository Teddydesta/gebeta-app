import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

import '../../../../utils/helpers.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4!
              .copyWith(color: AppColors.primary, fontSize: 16),
        ),
      ],
    );
  }
}
