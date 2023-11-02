import 'package:location/location.dart';

double lat = 0.0;
double lng = 0.0;
Location location = Location();
bool _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.denied;

class LocationPermission {
  void _locateMe() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}