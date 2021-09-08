class User {
  final int id;
  final String name;
  final String email;

  User({
    this.id,
    this.name,
    this.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['idUser'],
      name: json['name'],
      email: json['email']
    );
  }
}