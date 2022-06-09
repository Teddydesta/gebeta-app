import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customInputText.dart';

import '../../../widgets/customText.dart';
import '../../../services/productService.dart';
import '../../../services/categoryService.dart';
import '../../../models/Product.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({Key? key}) : super(key: key);

  @override
  _AddNewProductPageState createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final _keyForm = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _productServices = ProductServices();
  bool loading = false;
  List _images = [];
  String? _name;
  TextEditingController _nameController = TextEditingController();
  String? _description;
  TextEditingController _descriptionController = TextEditingController();
  String? _price;
  TextEditingController _priceController = TextEditingController();
  String? _category;
  String? _location;

  _validateName(String value) {
    value.trim();
    if (value.isEmpty) return 'Please enter product name';
    if (double.tryParse(value) != null) return 'Only text are allowed';

    return null;
  }

  _validateDescription(String value) {
    value.trim();
    if (value.isEmpty) return 'Please Enter product description';
    if (double.tryParse(value) != null) return 'Only text are allowed';

    return null;
  }

  _validatePrice(String value) {
    if (value.isEmpty) return 'Please Enter product price';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'ADD PRODUCT',
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          child: const CustomText(
            text: 'Cancel',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const AddNewProductPage()))),
            child: Container(
                child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const AddNewProductPage())));
              },
              child: Container(
                height: 35,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [AppColors.orange, Color(0xFFfbab66)],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  // color: AppColors.orange,
                ),
                child: Center(
                  child: const CustomText(
                    text: 'SAVE',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          children: [
            const SizedBox(height: 10.0),
            //  const CustomText(text: 'Product name'),
            const SizedBox(height: 5.0),

            CustomTextField(
              name: "Product Name",
              maxLength: 30,
              controller: _nameController,
              keyboardType: TextInputType.text,
              obscureText: false,
              loading: loading,
              validator: _validateName,
              onChange: (val) {
                setState(() {
                  _name = val;
                });
              },
              hintText: "Enter Product Name",
            ),
            CustomTextField(
              name: "Description",
              controller: _descriptionController ,
              keyboardType:TextInputType.multiline,
              obscureText: false,
              loading: loading,
              validator: _validateDescription,
                onChange: (val) {
                setState(() {
                  _description = val;
                });
              },
              hintText: "Enter here description",
            ),          CustomTextField(
              name: "Price",
              controller: _priceController ,
              keyboardType:TextInputType.number,
              obscureText: false,
              loading: loading,
              validator: _validateDescription,
                onChange: (val) {
                setState(() {
                  _price = val;
                });
              },
              hintText: "Product Price",
            ),
            const SizedBox(height: 20.0),
            //CustomText(text: 'Price'),
            const SizedBox(height: 5.0),

            const SizedBox(height: 20.0),

            const SizedBox(height: 10.0),
            // InkWell(
            //   onTap: () async {},
            //   child: Container(
            //     height: 150,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: BoxDecoration(
            //         color: Colors.grey[200],
            //         borderRadius: BorderRadius.circular(8.0)),

            //     // const Icon(Icons.wallpaper_rounded, size: 80, color: Colors.grey)
            //   ),
            // ),
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
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: (() => _deleteCategories(context)),
                        child: const CustomIcon(
                          backgroundColor: Colors.white,
                          icon: Icons.arrow_forward_ios,
                          iconSize: 24,
                        ),
                      )
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

void _deleteCategories(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
          margin: const EdgeInsets.only(top: 400, bottom: 0, right: 0, left: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 100, top: 20),
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomText(text: "Select category"),
              ],
            ),
          ));
    },
  );
}
