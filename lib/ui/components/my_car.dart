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
  bool isEntry = false;
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
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 0.06.sw),
                child: const Text(
                  "차량 번호 : 0000",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 0.9.sw,
                height: 0.05.sh,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  // isEntry 값에 따라 색깔이 바뀜
                  // true -> red
                  // false -> grey
                  color: isEntry
                      ? Colors.redAccent
                      : Color.fromARGB(255, 176, 176, 176),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 0.05.sw),
                  alignment: Alignment.centerRight,
                  child: Text(
                    isEntry ? "원" : "주차중이 아닙니다",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
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
