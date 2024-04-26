import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orai/ui/components/nav_bar.dart';
import 'package:orai/ui/components/parking_lot_widget.dart';

class ParkingLotPage extends StatefulWidget {
  const ParkingLotPage({super.key});

  @override
  State<ParkingLotPage> createState() => _ParkingLotPageState();
}

class _ParkingLotPageState extends State<ParkingLotPage> {
  @override
  Widget build(BuildContext context) {
    // DefaultTabController로 감싸줍니다.
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(),
        body: const ParkingLotWidget(),
      ),
    );
  }
}
