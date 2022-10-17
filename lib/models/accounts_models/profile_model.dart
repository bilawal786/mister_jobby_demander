// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.demandeurId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.country,
    required this.countryId,
    required this.image,
    required this.gender,
    required this.description,
    required this.memberSince,
    required this.totalHireJobber,
    required this.activeJobs,
    required this.totalReview,
    required this.rating,
    required this.reviews,
  });

  int demandeurId;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String country;
  int countryId;
  String image;
  String gender;
  String description;
  String memberSince;
  int totalHireJobber;
  int activeJobs;
  int totalReview;
  int rating;
  List<dynamic> reviews;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    demandeurId: json["demandeur_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    country: json["country"],
    countryId: json["country_id"],
    image: json["image"],
    gender: json["gender"],
    description: json["description"],
    memberSince: json["member_since"],
    totalHireJobber: json["total_hire_jobber"],
    activeJobs: json["active_jobs"],
    totalReview: json["total_review"],
    rating: json["rating"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "demandeur_id": demandeurId,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "address": address,
    "country": country,
    "country_id": countryId,
    "image": image,
    "gender": gender,
    "description": description,
    "member_since": memberSince,
    "total_hire_jobber": totalHireJobber,
    "active_jobs": activeJobs,
    "total_review": totalReview,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}
