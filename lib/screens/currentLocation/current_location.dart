import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    debugPrint("$lat, $long");
    setState(() {
      locationMessage = "Latitude : $lat,Longitide : $long";
    });
    List<Placemark> addresses =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    var first = addresses.first;
    print("${first.name}, ${first.locality},${first.country}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Service')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_on,
              size: 46.0,
              color: AppColors.orange,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Get User Location',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Position: $locationMessage",
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
                onPressed: () {
                  getCurrentLocation();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                child: Text(
                  "Get Current User Location",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
