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
      builder: (context, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                width: 0.9.sw,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: 0.33,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
