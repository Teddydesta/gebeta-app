import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("chicken"),
            ),
          ],
        ),
      ),
    );
  }
}
