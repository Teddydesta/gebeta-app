import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/cartScreen/components/PaymentScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 100,
              color: AppColors.orange,
              margin: EdgeInsets.only(
                  top: 0,
                  
                  bottom: 0
                  ),
                  
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const HomeMainScreen()))),
                          child: const CustomIcon(
                            icon: Icons.arrow_back_ios,
                            backgroundColor: AppColors.orange,
                            iconColor: Colors.white,
                            iconSize: 24,
                          ),),
                          SizedBox(
                        width: 150,
                      ),
                      const CustomText(
                        text: "BABIS ",
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          
            Row(
              children:  [
                CustomIcon(
                    icon: Icons.circle_outlined,
                    backgroundColor: Colors.white,
                    
                    iconSize: 22,
                    iconColor: AppColors.orange
                    ),
                SizedBox(
                  width: 25,
                ),
                CustomText(text: "Sweety Pizza"),
                SizedBox(
                  width: 45,
                ),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: CustomIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.placeholder,
                    iconSize: 24,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(text: "0"),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35),),
                  child: CustomIcon(
                    icon: Icons.add,
                    backgroundColor: AppColors.placeholder,
                    
                    iconSize: 24,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                CustomText(text: "ETB120")
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey[350],
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Bill Detail",
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "Item Total"),
                        CustomText(text: "ETB240.00")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "Distance Range"),
                        CustomText(text: "28 KM")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "delivery Charges"),
                        CustomText(text: "ETB25")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: " Total Discount"),
                        CustomText(text: "ETB0.00")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "To  Pay"),
                        CustomText(text: "ETB240.00")
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey[350],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(
                    text: "Order Type",
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children:  [
                      CustomIcon(
            icon: Icons.circle_outlined,
            iconColor: AppColors.orange,
            backgroundColor: Colors.white,
            iconSize: 24,
          ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomText(text: "Delivery"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) =>
                          const PaymentScreen()))),
              child: 
              Container(
                child: Center(
                  child: CustomText(text: "CHECKOUT",color: Colors.white,),
                  
                ),
                height: 50,
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  color: Colors.black,
                  
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}
