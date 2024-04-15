import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:orai/controllers/map_controller.dart';
import 'package:orai/ui/components/map.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late LatLng currentLocation;
  final FocusNode _focusNode = FocusNode();
  CustomMapController mapController = CustomMapController();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    // 화면이 표시된 직후 포커스를 요청합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });

    mapController.determinePosition().then((position) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  void dispose() {
    // FocusNode를 적절히 해제합니다.
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(left: 0.05.sw, top: 0.03.sh),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "항상 주차장이 부족하여 힘드셨나요?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0.05.sw),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "지금 바로 주변 주차장을 검색하고 예약 해보세요!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              SizedBox(
                width: 0.9.sw,
                child: TextFormField(
                  focusNode: _focusNode,
                  controller: _controller,
                  onFieldSubmitted: (value) {
                    // 검색 버튼을 누르면 필터링을 시작합니다.
                    _controller.text == '부산소프트웨어마이스터고등학교'
                        ? setState(() {
                            currentLocation = mapController
                                .getCoordinatesFromAddress('부산소프트웨어마이스터고등학교');
                          })
                        : currentLocation =
                            mapController.getCoordinatesFromAddress(value);
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
              SizedBox(
                height: 0.3.sh,
                width: 0.9.sw,
                child: buildMap(currentLocation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
