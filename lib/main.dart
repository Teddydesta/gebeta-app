import 'package:flutter/material.dart';

import 'screens/Address/add_address.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gebeta App',
      home: AddressScreen(),
    );
  }
}
