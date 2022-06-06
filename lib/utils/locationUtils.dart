import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationUtils {
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  static String errorText = '';

  Future getCurrentPosition() async {
    final hasPermission = await handlePermission();

    if (!hasPermission) {
      return {'error': errorText, 'result': null};
    }

    final position = await geolocatorPlatform.getCurrentPosition();
    return {
      'error': null,
      'result': {'lat': position.latitude, 'lng': position.longitude}
    };
  }

  Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      errorText = 'Location services are disabled.';
      return false;
    }

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        errorText = 'Permission denied.';
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      errorText = 'Permission denied forever.';
      return false;
    }

    return true;
  }

  Future getReverseGeolocation(lat, lng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(double.parse(lat), double.parse(lng));

      return {
        'error': null,
        'locationName':
            '${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}, ${placemarks[0].subLocality}, ${placemarks[0].street}'
      };
    } catch (err) {
      return {
        'error': 'Invalid coordinate couldnt get location.',
        'locationName': null
      };
    }
  }
}
