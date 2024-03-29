import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Example App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //title: const Text('Quick Feedback'),
        ),
        body: SingleChildScrollView(
          child: Container(
              // child: Center(
              //   child: FlatButton(
              //     onPressed: () => _showFeedback(
              //         context), // this will trigger the feedback modal
              //     child: const Text('Menu'),
              //   ),
              // ),
          ),
        ),
      ),
    );
  }
}

void _showFeedback(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin:
            const EdgeInsets.only(top: 200, left: 0, right: 200, bottom: 300),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "Recommended"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "doner"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "gril dish"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "oven/firin"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "pizza"),
            ),
            TextButton(
              onPressed: () {},
              child: const CustomText(text: "desert"),
            ),
          ],
        ),
      );
    },
  );
}
