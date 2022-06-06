import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final name;
  final controller;
  final keyboardType;
  final obscureText;
  final hintText;
  final loading;
  final onChange;
  final showPassword;
  final obsecureSuffixIcon;
  final validator;
  final maxLength;

  const CustomTextField({
    Key? key,
    this.name,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.hintText,
    this.onChange,
    this.obsecureSuffixIcon,
    this.showPassword,
    this.validator,
    this.loading,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 6.0),
          child: Text(
            name,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
        Theme(
          data: ThemeData(primarySwatch: Colors.orange),
          child: TextFormField(
            controller: controller,
            maxLength: maxLength,
            onChanged: onChange,
            keyboardType: keyboardType,
            maxLines: keyboardType == TextInputType.multiline ? null : 1,
            enabled: !loading,
            obscureText: obscureText ? !showPassword : obscureText,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                filled: true,
                hintStyle: TextStyle(color: Colors.black45),
                fillColor: Colors.grey.shade100,
                suffixIcon: obsecureSuffixIcon,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.orange, width: 3))),
            validator: (val) => validator(val),
          ),
        ),
      ],
    );
  }
}
