// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    required this.sliderImage,
  });

  String sliderImage;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    sliderImage: json["sliderImage"],
  );

  Map<String, dynamic> toJson() => {
    "sliderImage": sliderImage,
  };
}
