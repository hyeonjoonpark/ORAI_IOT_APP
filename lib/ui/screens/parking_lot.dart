import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orai/ui/components/nav_bar.dart';

class ParkingLotPage extends StatefulWidget {
  const ParkingLotPage({super.key});

  @override
  State<ParkingLotPage> createState() => _ParkingLotPageState();
}

class _ParkingLotPageState extends State<ParkingLotPage> {
  bool isEntry = false;
  @override
  Widget build(BuildContext context) {
    // DefaultTabController로 감싸줍니다.
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.05.sw),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "원하시는 주차자리를 선택하세요",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Entry",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Icon(Icons.arrow_downward),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (rowIndex) {
                    // 3행을 생성합니다.
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(2, (colIndex) {
                        // 각 행마다 2열을 생성합니다.
                        return Container(
                          margin: EdgeInsets.only(
                            left: 0.05.sw,
                            right: 0.05.sw,
                            top: 20,
                            bottom: 20,
                          ),
                          width: 140, // 사각형의 가로 크기
                          height: 70, // 사각형의 세로 크기
                          decoration: BoxDecoration(
                            color: const Color(0xffDDDDDD), // 사각형의 색상
                            borderRadius: BorderRadius.circular(10), // 모서리 둥글기
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // 버튼을 누르면 이벤트를 실행합니다.
                              print("사각형 인덱스: ($rowIndex, $colIndex)");
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: !isEntry
                                  ? const Color(0xffDDDDDD)
                                  : const Color(0xffBAC9FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: !isEntry
                                ? Text(
                                    "비어있음\n($rowIndex, $colIndex)",
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    "주차중\n($rowIndex, $colIndex)",
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
              const Icon(Icons.arrow_downward),
              const Text(
                "Exit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
