class Stamp {
  final int id;
  final String name;

  Stamp({
    required this.id,
    required this.name,
  });

  factory Stamp.fromJson(Map<String, dynamic> json) {
    return Stamp(
      id: json['idStamp'],
      name: json['name'],
    );
  }
}
