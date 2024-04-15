import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class CustomMapController {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('위치 서비스가 비활성화되어 있습니다');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부되면 종료
        return Future.error('위치 권한이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부된 경우
      return Future.error('위치 권한이 영구적으로 거부되었습니다. 설정에서 권한을 변경해주세요.');
    }

    // 실제 위치를 가져옴
    return await Geolocator.getCurrentPosition();
  }

  LatLng getCoordinatesFromAddress(String address) {
    // 부산소프트웨어마이스터고등학교 위도 경도
    const lat = 35.189062673028;
    const lon = 128.90405082258;

    return LatLng(lat, lon);
  }
}
