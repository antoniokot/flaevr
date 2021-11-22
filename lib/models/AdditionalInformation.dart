class AdditionalInformation {
  final int? id;
  final int idUser;
  final int age;
  final String gender;
  final int af;
  final double height;
  final double weight;
  final double idealWeight;

  AdditionalInformation({
    this.id,
    required this.idUser,
    required this.age,
    required this.gender,
    required this.af,
    required this.height,
    required this.weight,
    required this.idealWeight,
  });

  factory AdditionalInformation.fromJson(Map<String, dynamic> json) {
    return AdditionalInformation(
      id: json['idAdditionalInformation'],
      idUser: json['idUser'],
      age: json['age'],
      gender: json['gender'],
      af: json['af'],
      height: json['height'],
      weight: json['weight'],
      idealWeight: json['idealWeight'],
    );
  }
}
