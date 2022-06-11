import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/commonIconWidget.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class HotelsColumnWidget extends StatelessWidget {
    final HotelModel hotel;
    

//  UserServices _userServices = UserServices();
//   List<HotelModel> hotels = [];
  final String text;
   HotelsColumnWidget({Key? key, required this.text, required this.hotel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text,fontWeight: FontWeight.bold,),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.orange,
                );
              }),
            ),
            SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "4.6",
              fontSize: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "99",
              fontSize: 12,
            ),
            SizedBox(
              width: 10,
            ),
            const CustomText(
              text: "comments",
              fontSize: 12,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Container(
              width: 150,
              
              child: CustomText(
               
                text: hotel.description!,
                
              ),
            ),
            CommonIcon(
              icon: Icons.location_on,
              iconColor: AppColors.orange,
              text: '12.4km',
            ),
            // CommonIcon(
            //   icon: Icons.access_time_filled_rounded,
            //   text: "2:30 am",
            //   iconColor: AppColors.iconColor2,
            // ),
          ],
        ),
      ],
    );
  }
}
