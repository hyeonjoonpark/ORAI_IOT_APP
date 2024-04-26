import 'package:flutter/cupertino.dart';
import 'package:orai/provider/bottom_navigation_provider.dart';
import 'package:orai/ui/components/home_widget.dart';
import 'package:orai/ui/screens/parking_lot.dart';

Widget navigationBody(BottomNavigationProvider provider) {
  return provider.currentPage == 0
      ? const HomeWidget()
      : provider.currentPage == 1
          ? const ParkingLotPage()
          : const Placeholder();
}
