class Actions {
  int? id;
  String? name;

  Actions({this.id, this.name});

  factory Actions.parse(Map<String, dynamic> data) {
    return Actions(
      id: data['id'] as int?,
      name: data['name'] as String?,
    );
  }

  Map<String, dynamic> serialize() {
    return {
      'id': id,
      'name': name,
    };
  }
}
