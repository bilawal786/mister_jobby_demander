// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
  });

  Success success;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success.toJson(),
  };
}

class Success {
  Success({
    required this.token,
    required this.id,
  });

  String token;
  int id;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    token: json["token"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
  };
}
