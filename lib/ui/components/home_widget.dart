import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircleAvatar(
            radius: 35, // 동그라미의 반지름을 설정합니다.
            backgroundImage: NetworkImage(
                'https://cdn.hanryutimes.com/news/photo/202312/77225_88447_269.png'),
          ),
          SizedBox(width: 10) // 간격을 설정합니다.
        ],
      ),
    );
  }
}
