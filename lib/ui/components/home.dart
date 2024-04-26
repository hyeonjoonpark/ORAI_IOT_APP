import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orai/provider/bottom_navigation_provider.dart';
import 'package:orai/ui/components/bottom_navigation_widget.dart';
import 'package:orai/ui/components/navigation_body.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  late BottomNavigationProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: navigationBody(provider),
      bottomNavigationBar: bottomNavigationBarWidget(provider),
    );
  }
}
