// To parse this JSON data, do
//
//     final jobProposalsModel = jobProposalsModelFromJson(jsonString);

import 'dart:convert';

List<JobProposalsModel> jobProposalsModelFromJson(String str) => List<JobProposalsModel>.from(json.decode(str).map((x) => JobProposalsModel.fromJson(x)));

String jobProposalsModelToJson(List<JobProposalsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobProposalsModel {
  JobProposalsModel({
    required this.title,
    required this.price,
    required this.createdAt,
    required this.duration,
    required this.jobber,
  });

  String title;
  String price;
  String createdAt;
  String duration;
  Jobber jobber;

  factory JobProposalsModel.fromJson(Map<String, dynamic> json) => JobProposalsModel(
    title: json["title"],
    price: json["price"],
    createdAt: json["created_at"],
    duration: json["duration"],
    jobber: Jobber.fromJson(json["jobber"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "created_at": createdAt,
    "duration": duration,
    "jobber": jobber.toJson(),
  };
}

class Jobber {
  Jobber({
    required this.jobberId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.country,
    required this.image,
    required this.gender,
    required this.description,
    required this.hours,
    required this.totalHours,
    required this.memberSince,
    required this.experince,
    required this.totalJobs,
    required this.completedJobs,
    required this.cancelJobs,
    required this.equipements,
    required this.engagments,
    required this.personalDescription,
    required this.totalReview,
    required this.rating,
    required this.reviews,
  });

  int jobberId;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String country;
  String image;
  String gender;
  String description;
  String hours;
  String totalHours;
  DateTime memberSince;
  String experince;
  int totalJobs;
  int completedJobs;
  int cancelJobs;
  String equipements;
  String engagments;
  String personalDescription;
  int totalReview;
  int rating;
  List<Review> reviews;

  factory Jobber.fromJson(Map<String, dynamic> json) => Jobber(
    jobberId: json["jobber_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    country: json["country"],
    image: json["image"],
    gender: json["gender"],
    description: json["description"],
    hours: json["hours"],
    totalHours: json["total_hours"],
    memberSince: DateTime.parse(json["member_since"]),
    experince: json["experince"],
    totalJobs: json["total_jobs"],
    completedJobs: json["completed_jobs"],
    cancelJobs: json["cancel_jobs"],
    equipements: json["equipements"],
    engagments: json["engagments"],
    personalDescription: json["personal_description"],
    totalReview: json["total_review"],
    rating: json["rating"],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "jobber_id": jobberId,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "email": email,
    "address": address,
    "country": country,
    "image": image,
    "gender": gender,
    "description": description,
    "hours": hours,
    "total_hours": totalHours,
    "member_since": memberSince.toIso8601String(),
    "experince": experince,
    "total_jobs": totalJobs,
    "completed_jobs": completedJobs,
    "cancel_jobs": cancelJobs,
    "equipements": equipements,
    "engagments": engagments,
    "personal_description": personalDescription,
    "total_review": totalReview,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    required this.id,
    required this.userId,
    required this.name,
    required this.image,
    required this.message,
    required this.star,
    required this.date,
  });

  int id;
  int userId;
  String name;
  String image;
  String message;
  int star;
  String date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    message: json["message"],
    star: json["star"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "image": image,
    "message": message,
    "star": star,
    "date": date,
  };
}