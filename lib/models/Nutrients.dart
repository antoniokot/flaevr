class Scanned {
  final int id;
  final String name;

  Scanned({
    this.id,
    this.name,
  });

  factory Scanned.fromJson(Map<String, dynamic> json) {
    return Scanned(
      id: json['idNutrient'],  
      name: json['name'],
    );
  }
}