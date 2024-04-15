import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  LatLng? currentLocation;
  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  Future<Position> _determinePosition() async {
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

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('로딩 중...'),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
    }
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          actions: const [
            CircleAvatar(
              radius: 35, // 동그라미의 반지름을 설정합니다.
              backgroundImage: NetworkImage(
                'https://cdn.hanryutimes.com/news/photo/202312/77225_88447_269.png',
              ),
            ),
            SizedBox(width: 10) // 간격을 설정합니다.
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 0.9.sw,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    // 검색 버튼을 누르면 필터링을 시작합니다.
                  },
                  decoration: const InputDecoration(
                    hintText: '근처 주차장을 검색해보세요',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 나중에 구글 지도 API 연결합니다
              currentLocation == null
                  ? const Center(child: Text('로딩 중...'))
                  : Expanded(
                      child: Container(
                        width: 0.9.sw,
                        child: Expanded(
                          child: FlutterMap(
                            options: MapOptions(
                              // currentLocation이 null이 아니면 currentLocation을 사용하고, null이면 서울의 좌표를 기본값으로 사용합니다.
                              initialCenter: currentLocation ??
                                  const LatLng(37.715133, 126.734086),
                              initialZoom: 13.0,
                              maxZoom: 18.0,
                              minZoom: 10.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              ),
                              RichAttributionWidget(attributions: [
                                TextSourceAttribution(
                                  'OpenStreetMap contributors',
                                  onTap: () {},
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
