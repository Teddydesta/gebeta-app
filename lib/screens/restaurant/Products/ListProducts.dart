import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Products/AddNewProducts.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
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
                      const RestaurantHomeScreen()))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black, size: 24),
            ],
          ),
        ),
        actions: [


          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const AddNewProductPage()))),
            child: Container(
              margin: EdgeInsets.only(top: 15,right: 10),
              height: 10,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const AddNewProductPage())));
                  },
                  child:  Center(
                  child: const CustomText(
                      text: 'Add', color: Colors.white, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0),
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
            //physics: const BouncingScrollPhysics(),

            itemCount: 5,
            itemBuilder: (context, i) {
              return Container(
               margin: EdgeInsets.only(top: 0),
               width: double.maxFinite,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 100,
                      width: 90,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/real/pizza2.jpg"),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[50],
                        ),
                        child:  Column(
                          children: [
                            CustomIcon(icon: Icons.edit,iconColor: AppColors.orange,backgroundColor: Colors.white10,),
                            CustomText(text: "Burger", fontSize: 16),
                            SizedBox(height: 10,),
                            CustomText(text: "ETB120",color: AppColors.orange,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
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
                        image: AssetImage("assets/images/real/pizza2.jpg"),
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
                        child: const CustomText(text: "Burger", fontSize: 24),
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
