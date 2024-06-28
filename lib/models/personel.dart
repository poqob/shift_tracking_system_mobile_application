class Personel {
  final int? idNumber;
  final String? name;
  final String? surname;
  final String? email; // Changed 'mail' to 'email' for clarity
  final String? password;

  Personel({
    this.idNumber,
    this.name,
    this.surname,
    this.email,
    this.password,
  });

  factory Personel.parse(Map<String, dynamic> jsonData) {
    return Personel(
      idNumber: jsonData['id_number'] as int?,
      name: jsonData['name'] as String?,
      surname: jsonData['surname'] as String?,
      email: jsonData['mail'] as String?, // Changed 'mail' to 'email'
      password: jsonData['password'] as String?,
    );
  }

  Map<String, dynamic> serialize() {
    return {
      'id_number': idNumber,
      'name': name,
      'surname': surname,
      'email': email, // Changed 'mail' to 'email'
      'password': password,
    };
  }

  @override
  String toString() {
    return 'Personel(idNumber: $idNumber, name: $name, surname: $surname, email: $email, password: $password)';
  }
}
