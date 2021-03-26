// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.success,
    this.users,
  });

  bool success;
  List<User> users;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    success: json["success"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
    this.fname,
    this.lname,
    this.phone,
    this.email,
    this.imagePath,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String fname;
  String lname;
  String phone;
  String email;
  String imagePath;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fname: json["fname"],
    lname: json["lname"],
    phone: json["phone"],
    email: json["email"],
    imagePath: json["image_path"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fname": fname,
    "lname": lname,
    "phone": phone,
    "email": email,
    "image_path": imagePath,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
