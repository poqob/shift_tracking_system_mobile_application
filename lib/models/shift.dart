class Shift {
  final int? id;
  final String? entranceDate;
  final String? exitDate;

  Shift({
    this.id,
    this.entranceDate,
    this.exitDate,
  });

  factory Shift.parse(Map<String, dynamic> jsonData) {
    return Shift(
      id: jsonData['id'] as int?,
      entranceDate: jsonData['entrance_date'] as String?,
      exitDate: jsonData['exit_date'] as String?,
    );
  }

  Map<String, dynamic> serialize() {
    return {
      'id': id,
      'entrance_date': entranceDate,
      'exit_date': exitDate,
    };
  }

  @override
  String toString() {
    return 'Shift(id: $id, entranceDate: $entranceDate, exitDate: $exitDate)';
  }
}
