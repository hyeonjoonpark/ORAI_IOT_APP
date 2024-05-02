import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orai/provider/bottom_navigation_provider.dart';
import 'package:orai/provider/count_provider.dart';
import 'package:orai/routes/app_route.dart';
import 'package:orai/ui/components/home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Copyright 2024 @ All right reserved Team Orai AUTO_PARK",
      getPages: appRoute,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationProvider(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
