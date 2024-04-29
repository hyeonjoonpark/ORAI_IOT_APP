class ParkingStatus {
  final int parkingColumn;
  final int parkingRow;
  final String carStatus;

  ParkingStatus({required this.parkingColumn, required this.parkingRow, required this.carStatus});

  factory ParkingStatus.fromJson(Map<String, dynamic> json) {
    return ParkingStatus(
      parkingColumn: json['parkingColumn'],
      parkingRow: json['parkingRow'],
      carStatus: json['carStatus'],
    );
  }
}
