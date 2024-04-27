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
          Icons.directions_car,
        ),
        label: 'My Car',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.info,
        ),
        label: 'My Page',
      ),
    ],
    onTap: (index) {
      provider.updateCurrentPage(index);
    },
    currentIndex: provider.currentPage, // current page
    selectedItemColor: const Color(0xffBAC9FF),
  );
}
