// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLine;
  final bool readOnly;
  final FormFieldValidator<String>? validator;

  const FormField(
      {this.controller,
      required this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.validator,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 18),
      obscureText: isPassword,
      maxLines: maxLine,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: .5, color: Colors.grey)),
        contentPadding: const EdgeInsets.only(left: 15.0),
        hintText: hintText,
        hintStyle: GoogleFonts.getFont('Roboto', color: Colors.grey),
      ),
      validator: validator,
    );
  }
}
