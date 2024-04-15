import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParkingLotWidget extends StatefulWidget {
  const ParkingLotWidget({super.key});

  @override
  State<ParkingLotWidget> createState() => _ParkingLotWidgetState();
}

class _ParkingLotWidgetState extends State<ParkingLotWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => const Scaffold(
        body: Center(child: Text('주차장')),
      ),
    );
  }
}
