// To parse this JSON data, do
//
//     final searchCategoriesModel = searchCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<SearchCategoriesModel> searchCategoriesModelFromJson(String str) => List<SearchCategoriesModel>.from(json.decode(str).map((x) => SearchCategoriesModel.fromJson(x)));

String searchCategoriesModelToJson(List<SearchCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchCategoriesModel {
  SearchCategoriesModel({
    required this.id,
    required this.title,
    required this.img,
  });

  int id;
  String title;
  String img;

  factory SearchCategoriesModel.fromJson(Map<String, dynamic> json) => SearchCategoriesModel(
    id: json["id"],
    title: json["title"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "img": img,
  };
}
