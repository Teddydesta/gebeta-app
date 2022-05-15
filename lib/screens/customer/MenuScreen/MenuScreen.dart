import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:quick_feedback/quick_feedback.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quick Feedback'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: FlatButton(
                onPressed: () => _showFeedback(
                    context), // this will trigger the feedback modal
                child: Text('Menu'),
              ),
            ),
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
              child: CustomText(text: "Recommended"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "doner"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "chicken"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "gril dish"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "oven/firin"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "pizza"),
            ),
            TextButton(
              onPressed: () {},
              child: CustomText(text: "desert"),
            ),
          ],
        ),
      );
    },
  );
}
