import 'package:permission_handler/permission_handler.dart';

class LocationPermission {

  // 현재 위치 관련 권한 가져오기
  Future<bool> getLocationPermission() async {
    Map<Permission, PermissionStatus> status =
    await [Permission.location].request();

    if (await Permission.location.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}