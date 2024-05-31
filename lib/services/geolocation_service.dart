import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<String> getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      return "";
    }

    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return 'Longitude: ${location.longitude.toString()} \nLatitude: ${location.latitude.toString()} \nAltitude: ${location.altitude.toString()}';
  }
}
