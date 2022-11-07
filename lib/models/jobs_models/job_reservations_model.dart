// To parse this JSON data, do
//
//     final jobReservationsModel = jobReservationsModelFromJson(jsonString);

import 'dart:convert';

List<JobReservationsModel> jobReservationsModelFromJson(String str) => List<JobReservationsModel>.from(json.decode(str).map((x) => JobReservationsModel.fromJson(x)));

String jobReservationsModelToJson(List<JobReservationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobReservationsModel {
  JobReservationsModel({
    required this.id,
    required this.price,
    required this.contractNo,
    required this.hourlyRate,
    required this.adminCharges,
    required this.job,
    required this.jobberProfile,
    required this.status,
    required this.date,
  });

  int id;
  String price;
  String contractNo;
  String hourlyRate;
  String adminCharges;
  Job job;
  JobberProfile jobberProfile;
  int status;
  String date;

  factory JobReservationsModel.fromJson(Map<String, dynamic> json) => JobReservationsModel(
    id: json["id"],
    price: json["price"],
    contractNo: json["contract_no"],
    hourlyRate: json["hourly_rate"],
    adminCharges: json["admin_charges"],
    job: Job.fromJson(json["job"]),
    jobberProfile: JobberProfile.fromJson(json["jobberProfile"]),
    status: json["status"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "contract_no": contractNo,
    "hourly_rate": hourlyRate,
    "admin_charges": adminCharges,
    "job": job.toJson(),
    "jobberProfile": jobberProfile.toJson(),
    "status": status,
    "date": date,
  };
}

class Job {
  Job({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.subcategoryId,
    required this.childcategoryId,
    required this.image,
    required this.description,
    required this.detailDescription,
    required this.estimateBudget,
    required this.duration,
    required this.serviceDate,
    required this.views,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.startTime,
    required this.hours,
    required this.status,
    required this.address,
    required this.phone,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.small,
    required this.medium,
    required this.large,
    required this.verylarge,
    required this.question,
    required this.question1,
    required this.question2,
    required this.question3,
    required this.surface,
    required this.count,
    required this.input,
    required this.isHired,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.dob,
    required this.totalOffers,
    required this.jobberRequired,
    required this.totalComments,
  });

  int id;
  String title;
  int categoryId;
  int subcategoryId;
  int childcategoryId;
  String image;
  String description;
  String detailDescription;
  String estimateBudget;
  String duration;
  String serviceDate;
  int views;
  String latitude;
  String longitude;
  String createdAt;
  String startTime;
  String hours;
  int status;
  String address;
  String phone;
  String image1;
  String image2;
  String image3;
  String small;
  String medium;
  String large;
  String verylarge;
  String question;
  String question1;
  String question2;
  String question3;
  String surface;
  String count;
  String input;
  int isHired;
  String pickupAddress;
  String destinationAddress;
  String dob;
  int totalOffers;
  int jobberRequired;
  int totalComments;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    title: json["title"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    childcategoryId: json["childcategory_id"],
    image: json["image"],
    description: json["description"],
    detailDescription: json["detail_description"],
    estimateBudget: json["estimate_budget"],
    duration: json["duration"],
    serviceDate: json["service_date"],
    views: json["views"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: json["created_at"],
    startTime: json["start_time"],
    hours: json["hours"],
    status: json["status"],
    address: json["address"],
    phone: json["phone"],
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
    verylarge: json["verylarge"],
    question: json["question"],
    question1: json["question1"],
    question2: json["question2"],
    question3: json["question3"],
    surface: json["surface"],
    count: json["count"],
    input: json["input"],
    isHired: json["is_hired"],
    pickupAddress: json["pickup_address"],
    destinationAddress: json["destination_address"],
    dob: json["dob"],
    totalOffers: json["total_offers"],
    jobberRequired: json["jobber_required"],
    totalComments: json["total_comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "childcategory_id": childcategoryId,
    "image": image,
    "description": description,
    "detail_description": detailDescription,
    "estimate_budget": estimateBudget,
    "duration": duration,
    "service_date": serviceDate,
    "views": views,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt,
    "start_time": startTime,
    "hours": hours,
    "status": status,
    "address": address,
    "phone": phone,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "small": small,
    "medium": medium,
    "large": large,
    "verylarge": verylarge,
    "question": question,
    "question1": question1,
    "question2": question2,
    "question3": question3,
    "surface": surface,
    "count": count,
    "input": input,
    "is_hired": isHired,
    "pickup_address": pickupAddress,
    "destination_address": destinationAddress,
    "dob": dob,
    "total_offers": totalOffers,
    "jobber_required": jobberRequired,
    "total_comments": totalComments,
  };
}

class JobberProfile {
  JobberProfile({
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

  factory JobberProfile.fromJson(Map<String, dynamic> json) => JobberProfile(
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
