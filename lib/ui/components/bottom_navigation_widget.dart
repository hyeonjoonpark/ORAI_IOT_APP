import 'package:flutter/material.dart';
import 'package:orai/provider/bottom_navigation_provider.dart';

Widget bottomNavigationBarWidget(BottomNavigationProvider provider) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.local_parking,
        ),
        label: 'Parking Lot',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.info,
        ),
        label: 'My Car',
      ),
    ],
    onTap: (index) {
      provider.updateCurrentPage(index);
    },
    currentIndex: provider.currentPage, // current page
    selectedItemColor: const Color(0xffBAC9FF),
  );
}
