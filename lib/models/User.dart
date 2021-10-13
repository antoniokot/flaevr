class User {
  final int id;
  final String name;
  final String password;
  final String email;
  final int avatar;
  // boolean
  final String rememberMeToken;

  User({
    this.id,
    this.name,
    this.password,
    this.email,
    this.avatar,
    this.rememberMeToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['idUser'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      avatar: json['avatar'],
      rememberMeToken: json['remember_me_token'],
    );
  }
}