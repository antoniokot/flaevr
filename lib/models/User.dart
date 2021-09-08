class User {
  final int idUser;
  final String name;
  final String password;
  final String email;

  User({
    this.idUser,
    this.name,
    this.password,
    this.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'],
      name: json['name'],
      password: json['password'],
      email: json['email']
    );
  }
}