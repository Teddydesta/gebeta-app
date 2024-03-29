import 'package:gebeta_food_delivery/screens/restaurant/addProductScreen/AddNewProducts.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

import 'package:gebeta_food_delivery/widgets/app_Icon.dart';

import '../../../widgets/customText.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _keyForm = GlobalKey<FormState>();
  

 
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
                         AddNewProductPage()))),
            child: Container(
            
              child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                             AddNewProductPage())));
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
                      text: 'SAVE', color: Colors.black, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              ),)
            ),
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

            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                   counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),),

                  labelText: 'Product name',
                 // hintText: "product"
                 ),
              // The validator receives the text that the user has entered.
            ),
            //

            const SizedBox(height: 20.0),
            

            
            //

            
            //CustomText(text: 'Product description'),
           
            //
            TextFormField(
              
              maxLines: 8,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                 counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),),
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
            //CustomText(text: 'Product description'),
            const SizedBox(height: 5.0),
            //
            TextFormField(
              
              maxLines: 8,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                 counter: Offstage(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),),
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
             // maxLines: 1,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Price',
                hintText: "120.00 birr",
                 enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      //  borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
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
           
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () async {},
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0)),
                
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
