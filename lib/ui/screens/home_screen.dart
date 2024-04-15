import 'package:flutter/material.dart';

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
      length: 4, // 탭의 갯수
      child: Scaffold(
        body: TabBarView(
          // TabBarView 추가
          children: [
            Center(child: Icon(Icons.home)),
            Center(child: Icon(Icons.place)),
            Center(child: Icon(Icons.person)),
            Center(child: Icon(Icons.settings)),
          ],
        ),
        bottomNavigationBar: Material(
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.place)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
