import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

import '../../../widgets/customText.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({Key? key}) : super(key: key);

  @override
  _AddNewProductPageState createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const CustomText(
          text: 'Add New Product',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          child: const CustomText(
            text: 'Cancel',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: const CustomText(
                text: ' Save ',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ))
        ],
      ),
      //
      body: Form(
        key: _keyForm,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            const SizedBox(height: 10.0),
            const CustomText(text: 'Product name'),
            const SizedBox(height: 5.0),

            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'name',
                  hintText: "product"),
              // The validator receives the text that the user has entered.
            ),
            //

            const SizedBox(height: 20.0),
            //CustomText(text: 'Product description'),
            const SizedBox(height: 5.0),
            //
            TextFormField(
              maxLines: 6,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
//
            TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 6,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Price',
                hintText: "120.00 birr",
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Price is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20.0),
            //CustomText(text: 'Price'),
            const SizedBox(height: 5.0),

            const SizedBox(height: 20.0),
            const CustomText(text: 'Pictures'),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () async {},
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0)),
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, i) {
                      return Container(
                        height: 100,
                        width: 120,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/food0.png"),
                                fit: BoxFit.cover)),
                      );
                    }),
                // const Icon(Icons.wallpaper_rounded, size: 80, color: Colors.grey)
              ),
            ),
            const SizedBox(height: 20.0),
            const CustomText(text: 'Category'),
            const SizedBox(height: 5.0),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0)),
              child: Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 7, spreadRadius: -5.0)
                    ]),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.orange, width: 3.5),
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                          const SizedBox(width: 8.0),
                          const CustomText(text: 'Select Category'),
                        ],
                      ),
                      const Icon(Icons.navigate_next_rounded)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
