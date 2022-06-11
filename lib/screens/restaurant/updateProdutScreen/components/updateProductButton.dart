import 'package:flutter/material.dart';
class UpdateProductButton extends StatelessWidget {
  final loading;
  final onPressed;
  final size;
  const UpdateProductButton({Key? key, this.loading, this.onPressed, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.all(0.0),
        ),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE65C00),
                  Color(0xFFF9D423),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width, minHeight: 40.0),
            alignment: Alignment.center,
            child: loading
                ? Container(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white70),
                    ),
                  )
                : Text(
                    'Update Product',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
          ),
        ),
      ),
    );
  }
}