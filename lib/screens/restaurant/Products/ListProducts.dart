import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Products/AddNewProducts.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Products/EditProduct.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
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
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'PRODUCTS',
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      
        leadingWidth: 80,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((BuildContext context) =>
                      const EditProductScreen()))),
          child: Container(
            margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                height: 25,
                width: 60,
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
                      text: 'Edit', color: Colors.black, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              )
        ),
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
                            const AddNewProductPage())));
              },
              child: Container(
                height: 35,
                width: 70,
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
                      text: 'Add', color: Colors.black, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              ),)
            ),
          ),
        ],
      ),
      body: Container(
      margin: const EdgeInsets.only(top: 10,
        left: 10,
      ),
      child: Column(
        children: [
         
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: (() {
                Feedback.forLongPress(context);
                  }),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const ListProductScreen()))),
                  child: Container(
                     decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),

                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                    topRight: const Radius.circular(5.0),
                                    bottomRight: const Radius.circular(5.0)),
                                color: Colors.white),
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(
                        left: 0, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                             
                              
                             
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/real/breakfast.jpg"))),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                
                                borderRadius: const BorderRadius.only(
                                    topRight: const Radius.circular(5.0),
                                    bottomRight: const Radius.circular(5.0)),
                                color: Colors.white),
                            child:  Container(
                              padding: EdgeInsets.only(top: 15,left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomText(text: "BURGER",fontWeight: FontWeight.bold,),
                                 SizedBox(height: 10,),
                                  CustomText(text: "Product Description"),
                                 SizedBox(height: 15,),
                                 CustomText(text: "110.00",color: AppColors.orange,),
                               ],
                                
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => _deleteProduct(context)),
                          child: CustomIcon(icon: Icons.delete,backgroundColor: Colors.white,)),
                      ],
                    ),
                  ),
                );
              }),
        ],
        ),
    )
    );
  }
}

void _deleteProduct(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
          margin:
              const EdgeInsets.only(top: 250, bottom: 250, right: 80, left: 80),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const ListProductScreen()))),
                      child: const CustomIcon(
                        icon: Icons.close,
                        iconColor: Colors.red,
                        iconSize: 24,
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Are you sure?",
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/real/breakfast.jpg"),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[50],
                        ),
                        child: const CustomText(text: "BURGER", fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                  child: Container(
                     child: Center(child: CustomText( text: "REMOVE",
                     color: Colors.white,fontWeight: FontWeight.bold,),),
                      
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                     
                     ),
                ),
              ],
            ),
          ));
    },
  );
}
