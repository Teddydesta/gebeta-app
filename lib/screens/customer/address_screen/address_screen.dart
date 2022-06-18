import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapScreen> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(37.42796133580664, -122.085749655962)));
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Select Your Address",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          height: 500,
          child: GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
          ),
        ),
        Positioned(
            child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Set Delivery Location",
                      fontWeight: FontWeight.bold,
                    ),
                    //CustomText(text: "Location",fontWeight: FontWeight.bold,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Welkite Ethiopia",
                        // hide max character counter

                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 0, top: 520),
                decoration: BoxDecoration(color: Colors.grey[100]))),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 710),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black),
            child: Center(
                child: CustomText(
              text: "Save Address",
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
        
      ]),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
