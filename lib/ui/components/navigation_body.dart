import 'package:flutter/cupertino.dart';
import 'package:orai/provider/bottom_navigation_provider.dart';
import 'package:orai/ui/components/home_widget.dart';
import 'package:orai/ui/components/my_car.dart';
import 'package:orai/ui/components/my_page.dart';
import 'package:orai/ui/components/parking_lot_widget.dart';

Widget navigationBody(BottomNavigationProvider provider) {
  return provider.currentPage == 0
      ? const HomeWidget()
      : provider.currentPage == 1
          ? const MyCarWidget()
          : const MyPageWidget();
}
