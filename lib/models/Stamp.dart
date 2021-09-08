class Stamp {
  final int idStamp;
  final String name;

  Stamp({
    this.idStamp,
    this.name,
  });

  factory Stamp.fromJson(Map<String, dynamic> json) {
    return Stamp(
      idStamp: json['idStamp'],
      name: json['name'],
    );
  }
}
