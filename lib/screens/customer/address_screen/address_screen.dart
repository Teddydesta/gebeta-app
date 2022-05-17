import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addressscreen extends StatelessWidget {
  static const String routeName = "/Location";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => Addressscreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const Addressscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 180,
            width: double.maxFinite,
            child: const GoogleMap(
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(10, 10),
                zoom: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
