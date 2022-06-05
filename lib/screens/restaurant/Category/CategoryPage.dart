import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/restaurant/Category/Components/addcategoryScreen.dart';
import 'package:gebeta_food_delivery/screens/restaurant/HomeScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
// ignore: unused_import
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/CategoriesPage";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'CATEGORIES',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        centerTitle: true,
        leadingWidth: 80,
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
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            const AddCategoryPage())));
              },
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                            colors: [AppColors.orange, Color(0xFFfbab66)],
                            begin: FractionalOffset(0.2, 0.2),
                            end: FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(5),
                //  color: AppColors.orange,
                ),
                child: Center(
                  child: const CustomText(
                      text: 'Add', color: Colors.black, fontSize: 24,
                      fontWeight: FontWeight.bold,),
                ),
              ),)
        ],
      ),
      body: Center(
          child: Container(
              color: Colors.white,
              child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (() => _deleteCategories(context)),
                        child: Container(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Icon(Icons.icecream),
                              SizedBox(
                                width: 25,
                              ),
                              CustomText(text: "Ice Cream"),
                              SizedBox(
                                width: 180,
                              ),
                              Container(
                             
height: 40,
width: 50,
child: Center(child: CustomIcon(icon: Icons.more_horiz,
iconColor: AppColors.orange,
iconSize: 24,backgroundColor: Colors.white10,),),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  
),
                              ),
                            ],
                          ),
                          color: Colors.grey[100],
                          height: 75,
                          width: double.maxFinite,
                          //color: AppColors.orange,
                          margin: const EdgeInsets.only(
                              bottom: 5, left: 20, right: 20, top: 10),
                        ),
                      );
                    }),
              ))),
    );
  }
}

void _deleteCategories(context) {
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
                                  const CategoriesScreen()))),
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
