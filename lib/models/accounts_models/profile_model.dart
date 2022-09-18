// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.country,
    required this.countryId,
    required this.postalCode,
    required this.image,
    required this.categoryId,
    required this.subcategoryId,
    required this.role,
    required this.gender,
    required this.description,
    required this.dob,
  });

  int userId;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String country;
  int countryId;
  String postalCode;
  String image;
  int categoryId;
  int subcategoryId;
  int role;
  String gender;
  String description;
  String dob;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    userId: json["user_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    country: json["country"],
    countryId: json["country_id"],
    postalCode: json["postalCode"],
    image: json["image"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    role: json["role"],
    gender: json["gender"],
    description: json["description"],
    dob: json["dob"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "email": email,
    "address": address,
    "country": country,
    "country_id": countryId,
    "postalCode": postalCode,
    "image": image,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "role": role,
    "gender": gender,
    "description": description,
    "dob": dob,
  };
}
