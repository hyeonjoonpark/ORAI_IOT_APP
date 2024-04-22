import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orai/ui/components/nav_bar.dart';

class MyCarWidget extends StatefulWidget {
  const MyCarWidget({super.key});

  @override
  State<MyCarWidget> createState() => _MyCarWidgetState();
}

class _MyCarWidgetState extends State<MyCarWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.07.sw, top: 0.03.sh),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "내 차량 정보",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 0.06.sw),
                child: const Text(
                  "차량 번호 : 1234",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
