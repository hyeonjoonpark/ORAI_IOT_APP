import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
              Container(
                width: 0.9.sw,
                child: Image.network(
                  "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
