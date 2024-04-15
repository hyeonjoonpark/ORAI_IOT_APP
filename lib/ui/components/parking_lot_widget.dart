import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParkingLotWidget extends StatefulWidget {
  const ParkingLotWidget({super.key});

  @override
  State<ParkingLotWidget> createState() => _ParkingLotWidgetState();
}

class _ParkingLotWidgetState extends State<ParkingLotWidget> {
  bool isEntry = false;
  int? row;
  int? col;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
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
                              // TODO : 주차장 선택 시 하나의 주차장만 선택되도록 구현
                              setState(() {
                                isEntry = !isEntry;
                                row = rowIndex;
                                col = colIndex;
                              });
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
              Container(
                margin: EdgeInsets.only(left: 0.05.sw, top: 0.03.sh),
                alignment: Alignment.centerLeft,
                child: Text(
                  row == null && col == null
                      ? "주차자리를 선택해주세요"
                      : "$row행 $col열 주차장을 선택하셨습니다.",
                  style: row == null && col == null
                      ? const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        )
                      : const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0.05.sw),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "주차 요금은 1시간당 1000원입니다.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
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
