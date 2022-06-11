import 'package:flutter/material.dart';

class FlashMessageScreen extends StatelessWidget {
  const FlashMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child:ElevatedButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Default Snackbar"),
    behavior: SnackBarBehavior.floating,))}),));
  }
}
