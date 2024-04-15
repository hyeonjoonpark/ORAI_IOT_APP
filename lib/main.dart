import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orai/routes/app_route.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Portfoliio",
      getPages: appRoute,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
