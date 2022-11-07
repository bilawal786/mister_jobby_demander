// To parse this JSON data, do
//
//     final jobProposalsModel = jobProposalsModelFromJson(jsonString);

import 'dart:convert';

List<JobProposalsModel> jobProposalsModelFromJson(String str) => List<JobProposalsModel>.from(json.decode(str).map((x) => JobProposalsModel.fromJson(x)));

String jobProposalsModelToJson(List<JobProposalsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobProposalsModel {
  JobProposalsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.duration,
    required this.status,
    required this.jobber,
  });

  int id;
  String title;
  String price;
  String createdAt;
  String duration;
  int status;
  Jobber jobber;

  factory JobProposalsModel.fromJson(Map<String, dynamic> json) => JobProposalsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    createdAt: json["created_at"],
    duration: json["duration"],
    status: json["status"],
    jobber: Jobber.fromJson(json["jobber"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "created_at": createdAt,
    "duration": duration,
    "status": status,
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
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.memberSince,
    required this.experince,
    required this.totalJobs,
    required this.completedJobs,
    required this.cancelJobs,
    required this.skills,
    required this.badge,
    required this.qualification,
    required this.professional,
    required this.availableStatus,
    required this.pro,
    required this.verified,
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
  int gender;
  String description;
  String hours;
  String totalHours;
  String latitude;
  String longitude;
  String radius;
  DateTime memberSince;
  String experince;
  int totalJobs;
  int completedJobs;
  int cancelJobs;
  List<Skill> skills;
  int badge;
  String qualification;
  String professional;
  bool availableStatus;
  int pro;
  bool verified;
  String equipements;
  String engagments;
  String personalDescription;
  int totalReview;
  int rating;
  List<dynamic> reviews;

  factory Jobber.fromJson(Map<String, dynamic> json) => Jobber(
    jobberId: json["jobber_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    country: json["country"],
    image: json["image"],
    gender: json["gender"],
    description: json["description"],
    hours: json["hours"],
    totalHours: json["total_hours"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    radius: json["radius"],
    memberSince: DateTime.parse(json["member_since"]),
    experince: json["experince"],
    totalJobs: json["total_jobs"],
    completedJobs: json["completed_jobs"],
    cancelJobs: json["cancel_jobs"],
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    badge: json["badge"],
    qualification: json["qualification"],
    professional: json["professional"],
    availableStatus: json["available_status"],
    pro: json["pro"],
    verified: json["verified"],
    equipements: json["equipements"],
    engagments: json["engagments"],
    personalDescription: json["personal_description"],
    totalReview: json["total_review"],
    rating: json["rating"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "jobber_id": jobberId,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "address": address,
    "country": country,
    "image": image,
    "gender": gender,
    "description": description,
    "hours": hours,
    "total_hours": totalHours,
    "latitude": latitude,
    "longitude": longitude,
    "radius": radius,
    "member_since": memberSince.toIso8601String(),
    "experince": experince,
    "total_jobs": totalJobs,
    "completed_jobs": completedJobs,
    "cancel_jobs": cancelJobs,
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "badge": badge,
    "qualification": qualification,
    "professional": professional,
    "available_status": availableStatus,
    "pro": pro,
    "verified": verified,
    "equipements": equipements,
    "engagments": engagments,
    "personal_description": personalDescription,
    "total_review": totalReview,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}

class Skill {
  Skill({
    required this.id,
    required this.mainCategory,
    required this.subCategory,
    required this.skills,
    required this.equipments,
    required this.engagments,
    required this.experience,
    required this.diplomaName,
    required this.description,
  });

  int id;
  String mainCategory;
  String subCategory;
  String skills;
  String equipments;
  String engagments;
  String experience;
  String diplomaName;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    mainCategory: json["main_category"],
    subCategory: json["sub_category"],
    skills: json["skills"],
    equipments: json["equipments"],
    engagments: json["engagments"],
    experience: json["experience"],
    diplomaName: json["diploma_name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main_category": mainCategory,
    "sub_category": subCategory,
    "skills": skills,
    "equipments": equipments,
    "engagments": engagments,
    "experience": experience,
    "diploma_name": diplomaName,
    "description": description,
  };
}
