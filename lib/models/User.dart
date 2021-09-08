class User {
  final int id;
  final String name;
  final String password;
  final String email;

  User({
    this.id,
    this.name,
    this.password,
    this.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['idUser'],
      name: json['name'],
      password: json['password'],
      email: json['email']
    );
  }
}