import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Products/AddNewProducts.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const CustomText(
          text: 'List Products',
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leadingWidth: 80,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 24),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) => AddNewProductPage()))),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              AddNewProductPage())));
                },
                child: const CustomText(
                  text: 'Add',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),

      //
      body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {},
              onLongPress: () {},
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/real/western.png"),
                    )),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[50],
                      ),
                      child: const CustomText(text: "Burger", fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
