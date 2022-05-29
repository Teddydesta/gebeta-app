import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/RestaurantPage/RestaurantScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/columnWidget.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class NearByScreen extends StatefulWidget {
  const NearByScreen({Key? key}) : super(key: key);

  @override
  _NearByScreenState createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                child: const CustomText(

                  text: 'restaurants ',
                  fontSize: 24,
                  color: AppColors.mainBlackColor,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const CustomText(
                  text: '.',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const CustomText(
                  text: 'Restaurant pending',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: (() {
                Feedback.forLongPress(context);
                  }),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const RestaurantMainScreen()))),
                  child: Container(
                    padding: EdgeInsets.only(bottom: Dimensions.height10),
                    margin: EdgeInsets.only(
                        left: 0, right: 10, bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),

                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white38,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/food0.png"))),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),

                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                    topRight: const Radius.circular(5.0),
                                    bottomRight: const Radius.circular(5.0)),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 10.0),
                              child: ColumnWidget(
                                text: 'Babis Bistro',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
