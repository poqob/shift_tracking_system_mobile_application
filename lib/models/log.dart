class Log {
  final int personelId;
  final String entranceTime;
  final String exitDate;
  final int shiftId;

  Log({
    required this.personelId,
    required this.entranceTime,
    required this.exitDate,
    required this.shiftId,
  });

  factory Log.parse(Map<String, dynamic> jsonData) {
    return Log(
      personelId: jsonData['personel_id'] as int,
      entranceTime: jsonData['entrance_time'] as String,
      exitDate: jsonData['exit_date'] as String,
      shiftId: jsonData['shift_id'] as int,
    );
  }
}
