import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/BasketScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/productScreen/productScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/columnWidget.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

import '../../../widgets/descriptiontext.dart';
class PopularProductDetails extends StatelessWidget {
  final Product product;
  const PopularProductDetails({Key? key, required this.product, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.images![0]))),
              )),
          //left and right icons
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                               ProductsScreen()))),
                  child: const CustomIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    iconSize: 12,
                    backgroundColor: AppColors.orange,
                  ),
                ),
                GestureDetector(
                 onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                               BasketScreen()))),
                  child: const CustomIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconSize: 21,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.orange,
                  ),
                ),
              ],
            ),
          ),
          //
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              //

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  ColumnWidget(text: product.name!, product: product,),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(text: "Description"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: DescriptionText(
                        text:product.description!,
                           
                            
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(00.0), topRight: Radius.circular(40.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.orange),
              child: Row(
                children:  [
                  CustomIcon(
                    iconSize: 24,
                    icon: Icons.remove,
                    iconColor: Colors.black,
                    backgroundColor: AppColors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(text: '0',fontSize: 24,color: Colors.white,),
                  SizedBox(
                    width: 5,
                  ),
                  CustomIcon(
                    iconSize: 24,
                    icon: Icons.add,
                    iconColor: Colors.black,
                    backgroundColor: AppColors.orange,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.orange,
              ),
              child:  CustomText(
                text: 'Add to cart | ${product.price!.toString()}',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
