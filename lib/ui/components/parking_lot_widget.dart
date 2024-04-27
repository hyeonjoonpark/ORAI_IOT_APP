import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orai/ui/components/nav_bar.dart';

class ParkingLotWidget extends StatefulWidget {
  const ParkingLotWidget({super.key});

  @override
  State<ParkingLotWidget> createState() => _ParkingLotWidgetState();
}

class _ParkingLotWidgetState extends State<ParkingLotWidget> {
  bool isEntry = false;
  int? row;
  int? col;
  bool isReservation = false;
  int? selectedRow;
  int? selectedCol;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(),
        body: SingleChildScrollView(
          child: Center(
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
                              color: const Color(
                                  0xffDDDDDD), // Default color, will be overridden below
                              borderRadius:
                                  BorderRadius.circular(10), // 모서리 둥글기
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // Toggle the isReservation state to switch between empty and occupied colors
                                  isReservation = !isReservation;
                                  print('isReservation : $isReservation');
                                  if (isReservation) {
                                    // Change the color when the rectangle is selected
                                    selectedRow = rowIndex;
                                    selectedCol = colIndex;
                                  } else {
                                    // Reset the selected row and column when the rectangle is deselected
                                    selectedRow = null;
                                    selectedCol = null;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: !isEntry
                                    ? isReservation &&
                                            selectedRow == rowIndex &&
                                            selectedCol == colIndex
                                        ? Color(
                                            0xffffb6c1) // Pink color for reserved
                                        : const Color(
                                            0xffF5F5F5) // Gray color for empty
                                    : const Color(
                                        0xffBAC9FF), // Blue color for parked
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
                    selectedRow == null && selectedCol == null
                        ? "주차자리를 선택해주세요"
                        : "$selectedRow행 $selectedCol열 주차장을 선택하셨습니다.",
                    style: selectedRow == null && selectedCol == null
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
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 0.9.sw,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffBAC9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "주차장 예약하기",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
