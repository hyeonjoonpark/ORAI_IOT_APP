import 'package:get/get.dart';
import 'package:orai/ui/screens/home_screen.dart';
import 'package:orai/ui/screens/parking_lot.dart';

List<GetPage> appRoute = [
  GetPage(name: "/", page: () => const MyHomePage()),
  GetPage(name: "/parkinglot", page: () => const ParkingLotPage()),
];
