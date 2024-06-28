class Attendance {
  final int personelId;
  final String entranceTime;
  final String exitDate;
  final int shiftId;

  Attendance({
    required this.personelId,
    required this.entranceTime,
    required this.exitDate,
    required this.shiftId,
  });

  factory Attendance.parse(Map<String, dynamic> jsonData) {
    return Attendance(
      personelId: jsonData['personel_id'] as int,
      entranceTime: jsonData['entrance_time'] as String,
      exitDate: jsonData['exit_date'] as String,
      shiftId: jsonData['shift_id'] as int,
    );
  }
}
