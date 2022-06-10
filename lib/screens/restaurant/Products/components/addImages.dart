import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class AddImageButton extends StatelessWidget {
  final onPressed;
  final size;
  final loading;
  const AddImageButton({Key? key, this.onPressed, this.size, this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orange,
        minimumSize: Size(size.width, 50.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
      ),
      child: Text(
        'Add Images',
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }
}