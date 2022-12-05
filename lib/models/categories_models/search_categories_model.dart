// To parse this JSON data, do
//
//     final searchCategoriesModel = searchCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<SearchCategoriesModel> searchCategoriesModelFromJson(String str) => List<SearchCategoriesModel>.from(json.decode(str).map((x) => SearchCategoriesModel.fromJson(x)));

String searchCategoriesModelToJson(List<SearchCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchCategoriesModel {
  SearchCategoriesModel({
    required this.maincategoryId,
    required this.subcategoryId,
    required this.childcategoryId,
    required this.title,
    required this.image,
  });

  int maincategoryId;
  int subcategoryId;
  int childcategoryId;
  String title;
  String image;

  factory SearchCategoriesModel.fromJson(Map<String, dynamic> json) => SearchCategoriesModel(
    maincategoryId: json["maincategory_id"],
    subcategoryId: json["subcategory_id"],
    childcategoryId: json["childcategory_id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "maincategory_id": maincategoryId,
    "subcategory_id": subcategoryId,
    "childcategory_id": childcategoryId,
    "title": title,
    "image": image,
  };
}
