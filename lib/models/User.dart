class User {
  final int id;
  final String name;
  final String password;
  final String email;
  final String pictureFileName;
  final String pictureData;
  // boolean
  final String rememberMeToken;

  User({
    this.id,
    this.name,
    this.password,
    this.email,
    this.pictureFileName,
    this.pictureData,
    this.rememberMeToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['idUser'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      pictureFileName: json['pictureFileName'],
      pictureData: json['pictureData'],
      rememberMeToken: json['remember_me_token'],
    );
  }
}