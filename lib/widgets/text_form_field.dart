import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;

  final TextInputType keyboardType;
  final int maxLine;
  final bool readOnly;

  const TextFormFieldWidget({
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLine = 1,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        child: Container(
          height: 68,
          width: 60,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "0",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
              ),
              onChanged: ((value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
