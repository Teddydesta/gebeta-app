import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';
import 'package:gebeta_food_delivery/models/Product.dart';
import 'package:gebeta_food_delivery/models/UserModel.dart';
import 'package:gebeta_food_delivery/screens/customer/hotelMenuScreen/hotelMenuScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/productScreen/productScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gebeta_food_delivery/widgets/hotelsColumnWidget.dart';
import "package:gebeta_food_delivery/services/userServices.dart";
import 'package:geolocator/geolocator.dart';

class NearByScreen extends StatefulWidget {
  
  NearByScreen({
    Key? key, 
  }) : super(key: key);

  @override
  _NearByScreenState createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var locationMessage = "";
  bool loading = true;
  UserServices _userServices = UserServices();
  List<HotelModel> hotels = [];
  var lat = 0;
  var lng = 0;

  getNearbyHotels() async {
    print('tap');
    setState(() {
      loading = true;
    });
    hotels.clear();
    var res = await _userServices.getNearbyHotel(
        lat: lat.toString(), lng: lng.toString());
print(res);
    if (res == null) {
      setState(() {
        loading = false;
      });
      // error message
      return;
    }
 List<HotelModel> hotelRes =  (res as List).map((h) => HotelModel.fromJson(h)).toList();
    setState(() {
      hotels.clear();
     hotels.addAll(hotelRes);
      loading = false;
    });
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    debugPrint("$lat, $long");
    setState(() {
      locationMessage = "Latitude : $lat , Longitide : $long";
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    getNearbyHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: Column(
          children: [
             GestureDetector(
                      onTap: () => getNearbyHotels(),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: CustomText(
                          text: "babis",
                          fontSize: 24,
                          color: AppColors.mainBlackColor,
                        ),
                      ),
                    ),
            CircularProgressIndicator(),
          ],
        ))
        : Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => getNearbyHotels(),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: CustomText(
                          text: "babis",
                          fontSize: 24,
                          color: AppColors.mainBlackColor,
                        ),
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
                  height: 15,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: (() {
                          Feedback.forLongPress(context);
                        }),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                     HotelMenuScreen()))),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          margin:
                              EdgeInsets.only(left: 0, right: 10, bottom: 10),
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
                                        image: AssetImage(
                                            "assets/images/food0.png"))),
                              ),
                              Expanded(
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),

                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.only(
                                          topRight: const Radius.circular(5.0),
                                          bottomRight:
                                              const Radius.circular(5.0)),
                                      color: Colors.white),
                                  child:  Padding(
                                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                                    child: HotelsColumnWidget(
                                      text: hotels[index].name!,
                                    ),
                                                                )                                ),
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
