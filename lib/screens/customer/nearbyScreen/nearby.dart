import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/models/Hotel.dart';

import 'package:gebeta_food_delivery/screens/customer/hotelMenuScreen/hotelMenuScreen.dart';

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
  //Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var locationMessage = "";
  bool loading = true;
  UserServices _userServices = UserServices();
  List<HotelModel> hotels = [];
  var lat = 0.0;
  var lng = 0.0;

  getNearbyHotels() async {
    print('tap');
    setState(() {
      loading = true;
    });
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    lat = position.latitude;
    lng = position.longitude;
    debugPrint("$lat, $lng");
    setState(() {
      locationMessage = "Latitude : $lat , Longitide : $lng";
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
    List<HotelModel> hotelRes =
        (res as List).map((h) => HotelModel.fromJson(h)).toList();
    setState(() {
      hotels.clear();
      hotels.addAll(hotelRes);
      loading = false;
    });
  }

  void getCurrentLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      var lastPosition = await Geolocator.getLastKnownPosition();

      print(lastPosition);
      lat = position.latitude;
      lng = position.longitude;
      debugPrint("$lat, $lng");
      setState(() {
        locationMessage = "Latitude : $lat , Longitide : $lng";
      });
    }
  }

  initFn() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      LocationPermission res = await Geolocator.requestPermission();
      if (res == LocationPermission.always ||
          res == LocationPermission.whileInUse) {
        getCurrentLocation();
        getNearbyHotels();
      } else {
        setState(() {
          locationMessage = "Latitude : ${0.0} , Longitide : ${0.0}";
        });
      }
    } else {
      getCurrentLocation();
      getNearbyHotels();
    }
  }

  @override
  void initState() {
    initFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
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
                        child: Text(
                          'Nearest Hotels ',
                          maxLines: 2,
                          style: TextStyle(
                              wordSpacing: 8.0,
                              fontFamily: 'lobster',
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
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
                                    HotelMenuScreen(hotel: hotels[index])))),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          margin:
                              EdgeInsets.only(left: 0, right: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 150,
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
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(hotels[index].images![0]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),

                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: HotelsColumnWidget(
                                        hotel: hotels[index],
                                        text: hotels[index].name!,
                                      ),
                                    )),
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
