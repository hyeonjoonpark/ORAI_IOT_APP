import 'package:flutter/material.dart';
import 'package:orai/ui/components/home_widget.dart';
import 'package:orai/ui/components/my_car.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // DefaultTabController로 감싸줍니다.
    return const DefaultTabController(
      length: 3, // 탭의 갯수
      child: Scaffold(
        body: TabBarView(
          // TabBarView 추가
          children: [
            HomeWidget(),
            MyCarWidget(),
            Center(child: Icon(Icons.settings)),
          ],
        ),
        bottomNavigationBar: Material(
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
