// To parse this JSON data, do
//
//     final jobsInProgressModel = jobsInProgressModelFromJson(jsonString);

import 'dart:convert';

List<JobsInProgressModel> jobsInProgressModelFromJson(String str) => List<JobsInProgressModel>.from(json.decode(str).map((x) => JobsInProgressModel.fromJson(x)));

String jobsInProgressModelToJson(List<JobsInProgressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsInProgressModel {
  JobsInProgressModel({
    required this.id,
    required this.title,
    required this.image,
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
  String image;
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

  factory JobsInProgressModel.fromJson(Map<String, dynamic> json) => JobsInProgressModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
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
    "image": image,
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
