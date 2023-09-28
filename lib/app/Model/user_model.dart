import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.email,
    this.password,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? password,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };
  Map<String, dynamic> toDB() => {
        "email": email,
        "password": password,
      };
}
